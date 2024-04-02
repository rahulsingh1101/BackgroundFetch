//
//  VideoRecorderFactory.swift
//  RecordingModule
//
//  Created by Rahul Singh on 01/04/24.
//

import Foundation

public protocol VideoRecorderFactory {
    func createVideoRecorder() -> VideoRecorder
    func createViewController() -> RecordedVideoListViewController
}
