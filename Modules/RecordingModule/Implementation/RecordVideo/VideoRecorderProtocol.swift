import Foundation

public protocol VideoRecorderProtocol {
    func startRecording()
    func pauseRecording()
    func resumeRecording()
    func resetRecording()
    func uploadVideo()
}
