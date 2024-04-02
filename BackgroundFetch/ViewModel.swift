//
//  ViewCellModel.swift
//  BackgroundFetch
//
//  Created by Rahul Singh on 01/04/24.
//

import Foundation
import UtilityModule

struct ViewCellModel {
    let name: String
    let type: CellType
}

enum CellType {
    case start_recording
    case stop_recording
    case recorded_videos
}

struct ViewModel {
    private let cellModels: [ViewCellModel] = [
        ViewCellModel(name: "Start Recording", type: .start_recording),
        ViewCellModel(name: "Stop Recording", type: .stop_recording),
        ViewCellModel(name: "Recorded Videos", type: .recorded_videos)
    ]
    
    func getModelFor(index: Int) -> ViewCellModel? {
        cellModels[safe: index]
    }
    
    func getNumberOfCells() -> Int {
        cellModels.count
    }
}
