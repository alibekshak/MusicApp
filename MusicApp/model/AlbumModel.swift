import Foundation

struct AlbumResponse: Codable {
    let results: [Album]
}

struct Album: Codable, Equatable {
    let wrapperType, collectionType: String
    let collectionId: Int
    let artistName, collectionName, collectionCensoredName: String?
    let artistViewURL, collectionViewURL: String?
    let artworkUrl60, artworkUrl100: String
    let collectionExplicitness: String
    let trackCount: Int
    let copyright, country, currency: String?
    let primaryGenreName: String
    let previewUrl: String?

}





