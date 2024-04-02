//
//  DefaultVideoRecorderFactory.swift
//  RecordingModule
//
//  Created by Rahul Singh on 01/04/24.
//

import Foundation

public class DefaultVideoRecorderFactory: VideoRecorderFactory {
    private var videoRecorder: VideoRecorder?
    
    public func createVideoRecorder() -> VideoRecorder {
//        if let videoRecorder {
//            return videoRecorder
//        } else {
//            self.videoRecorder = VideoRecorder()
//            return videoRecorder!
//        }
        
        VideoRecorder()
    }
    
    public func createViewController() -> RecordedVideoListViewController {
        let manageRecordedVideos = ManageRecordedVideos(videoRecorder: createVideoRecorder())
        let viewModel = RecordedVideoListViewModel(manageRecordedVideos: manageRecordedVideos)
        let controller = RecordedVideoListViewController(viewModel: viewModel)
        
        return controller
    }
    
    public init() { } 
}
