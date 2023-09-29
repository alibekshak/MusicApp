import Foundation

struct SongResults: Codable, Equatable {
    let artistName: String
    let trackName: String?
    let artworkUrl100: String
    let previewUrl: String?
}

struct SongResponse: Codable {
    let results: [SongResults]
}
