
import UIKit

public final class RecordedVideoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let viewModel: RecordedVideoListViewModel
    private let tableView = UITableView()
    private var recordedVideos: [URL] = []

    public init(viewModel: RecordedVideoListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchRecordedVideos()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    private func fetchRecordedVideos() {
        recordedVideos = viewModel.getAllRecordedVideos()
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordedVideos.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let videoURL = recordedVideos[indexPath.row]
        cell.textLabel?.text = videoURL.lastPathComponent
        return cell
    }

    // MARK: - UITableViewDelegate

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Handle selection of recorded video
        // You can implement video playback or any other action here
    }
}
