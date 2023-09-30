import Foundation

struct SongResults: Codable, Equatable {
    let artistName: String
    let trackName: String?
    let artworkUrl100: String
    let artworkUrl60: String
    let previewUrl: String?
    let collectionName: String?
}


struct SongResponse: Codable {
    let results: [SongResults]
}

