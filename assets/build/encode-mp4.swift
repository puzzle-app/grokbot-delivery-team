// Encodes a list of PNG frames into an H.264 MP4 with AVFoundation. No ffmpeg needed on a Mac.
// Usage: swift encode-mp4.swift <frames.txt> <out.mp4> <width> <height> <fps>
// frames.txt: one line per frame, "<path> <duration_ms>".
import AVFoundation
import AppKit

let a = CommandLine.arguments
let listPath = a[1], outPath = a[2]
let width = Int(a[3])!, height = Int(a[4])!, fps = Int32(a[5])!

struct F { let path: String; let ms: Int }
let frames: [F] = try! String(contentsOfFile: listPath).split(separator: "\n").compactMap { line in
  let parts = line.split(separator: " ")
  guard parts.count >= 2, let ms = Int(parts.last!) else { return nil }
  return F(path: parts.dropLast().joined(separator: " "), ms: ms)
}

let url = URL(fileURLWithPath: outPath)
try? FileManager.default.removeItem(at: url)
let writer = try! AVAssetWriter(outputURL: url, fileType: .mp4)
let settings: [String: Any] = [
  AVVideoCodecKey: AVVideoCodecType.h264,
  AVVideoWidthKey: width, AVVideoHeightKey: height,
  AVVideoCompressionPropertiesKey: [AVVideoAverageBitRateKey: 6_000_000, AVVideoProfileLevelKey: AVVideoProfileLevelH264HighAutoLevel]
]
let input = AVAssetWriterInput(mediaType: .video, outputSettings: settings)
input.expectsMediaDataInRealTime = false
let adaptor = AVAssetWriterInputPixelBufferAdaptor(assetWriterInput: input, sourcePixelBufferAttributes: [
  kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32ARGB,
  kCVPixelBufferWidthKey as String: width, kCVPixelBufferHeightKey as String: height])
writer.add(input)
writer.startWriting(); writer.startSession(atSourceTime: .zero)

func buffer(for path: String) -> CVPixelBuffer {
  let img = NSImage(contentsOfFile: path)!
  var rect = NSRect(x: 0, y: 0, width: width, height: height)
  let cg = img.cgImage(forProposedRect: &rect, context: nil, hints: nil)!
  var pb: CVPixelBuffer?
  CVPixelBufferPoolCreatePixelBuffer(nil, adaptor.pixelBufferPool!, &pb)
  let b = pb!
  CVPixelBufferLockBaseAddress(b, [])
  let ctx = CGContext(data: CVPixelBufferGetBaseAddress(b), width: width, height: height, bitsPerComponent: 8,
                      bytesPerRow: CVPixelBufferGetBytesPerRow(b), space: CGColorSpaceCreateDeviceRGB(),
                      bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue | CGBitmapInfo.byteOrder32Little.rawValue)!
  ctx.draw(cg, in: CGRect(x: 0, y: 0, width: width, height: height))
  CVPixelBufferUnlockBaseAddress(b, [])
  return b
}

var t: Int64 = 0 // in 1/1000 s
for f in frames {
  while !input.isReadyForMoreMediaData { Thread.sleep(forTimeInterval: 0.01) }
  let pb = buffer(for: f.path)
  let pts = CMTime(value: t, timescale: 1000)
  adaptor.append(pb, withPresentationTime: pts)
  t += Int64(f.ms)
}
// hold the last frame to the end
if let last = frames.last {
  while !input.isReadyForMoreMediaData { Thread.sleep(forTimeInterval: 0.01) }
  adaptor.append(buffer(for: last.path), withPresentationTime: CMTime(value: t, timescale: 1000))
}
input.markAsFinished()
writer.endSession(atSourceTime: CMTime(value: t + 1000 / Int64(fps), timescale: 1000))
let sem = DispatchSemaphore(value: 0)
writer.finishWriting { sem.signal() }
sem.wait()
print("wrote \(outPath), \(frames.count) frames, \(Double(t) / 1000)s, status \(writer.status.rawValue)")
