
class DefaultRecordedVideoListViewModelFactory: RecordedVideoListViewModelFactory {
    func createRecordedVideoListViewModel() -> RecordedVideoListViewModel {
        let videoRecorder = VideoRecorder()
        let manageRecordedVideos = ManageRecordedVideos(videoRecorder: videoRecorder)
        return RecordedVideoListViewModel(manageRecordedVideos: manageRecordedVideos)
    }
}
