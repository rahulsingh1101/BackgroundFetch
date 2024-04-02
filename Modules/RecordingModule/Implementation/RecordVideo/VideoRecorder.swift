import UIKit
import AVFoundation
import UtilityModule

public final class VideoRecorder: NSObject {
    
    public weak var delegate: VideoRecorderDelegate?
    
    private var captureSession: AVCaptureSession?
    private var videoOutput: AVCaptureMovieFileOutput?
    private var videoURL: URL?
    private(set) var recordedVideoURLs: [URL] = []
    
    override init() {
        super.init()
        setupCaptureSession()
    }

    private func setupCaptureSession() {
        captureSession = AVCaptureSession()
        
        guard let captureSession = captureSession else { return }
        
        // Setup inputs
        guard let videoDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let audioDevice = AVCaptureDevice.default(for: .audio) else { return }
        
        do {
            let videoInput = try AVCaptureDeviceInput(device: videoDevice)
            let audioInput = try AVCaptureDeviceInput(device: audioDevice)
            
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
            }
            if captureSession.canAddInput(audioInput) {
                captureSession.addInput(audioInput)
            }
        } catch {
            delegate?.videoRecorderDidFail(withError: error)
            return
        }
        
        // Setup output
        videoOutput = AVCaptureMovieFileOutput()
        if let videoOutput = videoOutput, captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        }
    }

    public func startRecording() {
        guard captureSession != nil else { return }
        guard let videoOutput = videoOutput else { return }
        
        let outputPath = NSTemporaryDirectory() + "output.mov"
        let outputFileURL = URL(fileURLWithPath: outputPath)
        
        videoOutput.startRecording(to: outputFileURL, recordingDelegate: self)
        videoURL = outputFileURL
        print("video url ::\(String(describing: videoURL))")
        callRecordingStartedDelegate()
    }

    public func stopRecording() {
        videoOutput?.stopRecording()
        callRecordingEndedDelegate()
    }
    
    func deleteRecordedVideo(at index: Int) {
        guard let fileURL = recordedVideoURLs[safe: index] else { return }
        do {
            try FileManager.default.removeItem(at: fileURL)
            recordedVideoURLs.remove(at: index)
            delegate?.recordedVideoDeleted(result: .success(true))
        } catch {
            delegate?.recordedVideoDeleted(result: .failure(error))
            print("Error deleting recorded video: \(error.localizedDescription)")
        }
    }
    
    private func callRecordingStartedDelegate() {
        delegate?.videoRecorderDidStart()
    }
    
    private func callRecordingEndedDelegate() {
        delegate?.videoRecorderDidStop()
    }
}

extension VideoRecorder: AVCaptureFileOutputRecordingDelegate {
    public func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        // Recording started
    }
    
    public func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if let error = error {
            delegate?.videoRecorderDidFail(withError: error)
        } else {
            recordedVideoURLs.append(outputFileURL)
            delegate?.videoRecorderDidFinishRecording(url: outputFileURL)
        }
    }
}
