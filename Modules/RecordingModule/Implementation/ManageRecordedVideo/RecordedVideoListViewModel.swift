import Foundation

public final class RecordedVideoListViewModel {
    private let manageRecordedVideos: ManageRecordedVideos

    public init(manageRecordedVideos: ManageRecordedVideos) {
        self.manageRecordedVideos = manageRecordedVideos
    }

    public func getAllRecordedVideos() -> [URL] {
        return manageRecordedVideos.getAllRecordedVideos()
    }
}

