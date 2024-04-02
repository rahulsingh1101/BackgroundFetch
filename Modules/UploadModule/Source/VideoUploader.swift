import Foundation

protocol VideoSourceProtocol {
    
}

protocol VideoUploaderProtocol {
    func uploadVideoFrom(source: VideoSourceProtocol)
}

class VideoUploader {
    // Implement video uploading functionality here
}

class VideoSource {
    // local File System path
    // local File URL
}

