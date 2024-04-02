
import Foundation

public final class ManageRecordedVideos {
    private let videoRecorder: VideoRecorder

    public init(videoRecorder: VideoRecorder) {
        self.videoRecorder = videoRecorder
    }
    
    public func getAllRecordedVideos() -> [URL] {
        print("recorded videos :: \(videoRecorder.recordedVideoURLs)")
        return videoRecorder.recordedVideoURLs
    }
    
    func deleteRecordedVideo(at index: Int) {
        videoRecorder.deleteRecordedVideo(at: index)
    }
}
