import Foundation


struct ItunesMusic: Codable {
    let artistName: String
    let trackName: String?
    let artworkUrl100: String
    let previewUrl: String?
}

struct ItunesResponse: Codable {
    let resultCount: Int
    let results: [ItunesMusic]
}
