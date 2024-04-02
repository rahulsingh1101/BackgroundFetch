//
//  VideoRecorderDelegate.swift
//  RecordingModule
//
//  Created by Rahul Singh on 01/04/24.
//

import Foundation

public protocol VideoRecorderDelegate: AnyObject {
    func videoRecorderDidFinishRecording(url: URL)
    func videoRecorderDidFail(withError error: Error)
    func videoRecorderDidStart()
    func videoRecorderDidStop()
    func recordedVideoDeleted(result: Result<Bool, Error>)
}
