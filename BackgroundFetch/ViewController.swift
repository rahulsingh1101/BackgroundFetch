//
//  ViewController.swift
//  BackgroundFetch
//
//  Created by Rahul Singh on 31/03/24.
//

import UIKit
import RecordingModule

final class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    private var videoRecorderFactory: VideoRecorderFactory = DefaultVideoRecorderFactory()
    private var videoRecorder: VideoRecorder!
    private var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoRecorder = videoRecorderFactory.createVideoRecorder()
        videoRecorder.delegate = self
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - UITableViewDataSource
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfCells()
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let model = viewModel.getModelFor(index: indexPath.row) {
            cell.textLabel?.text = model.name
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let model = viewModel.getModelFor(index: indexPath.row) {
            switch model.type {
            case .start_recording:
                videoRecorder.startRecording()
            case .stop_recording:
                videoRecorder.stopRecording()
            case .recorded_videos:
                // Navigate to List view
                navigateTo()
            }
        }
    }
    
    private func navigateTo() {
        let controller = videoRecorderFactory.createViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ViewController: VideoRecorderDelegate {
    // MARK: - VideoRecorderDelegate
    
    func recordedVideoDeleted(result: Result<Bool, any Error>) {
        print("recordedVideoDeleted ::\(result)")
    }
    
    func videoRecorderDidStop() {
        print("videoRecorderDidStop")
    }
    
    func videoRecorderDidStart() {
        print("videoRecorderDidStart")
    }
    
    func videoRecorderDidFinishRecording(url: URL) {
        print("videoRecorderDidFinishRecording")
    }
    
    func videoRecorderDidFail(withError error: Error) {
        print("videoRecorderDidFail")
    }
}
