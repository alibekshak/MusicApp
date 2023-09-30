import Foundation


struct AlbumResponse: Codable {
    let results: [Album]
}

struct Album: Codable, Equatable {
    let wrapperType, collectionType: String
    let artistName, collectionName, collectionCensoredName: String?
    let artistViewURL, collectionViewURL: String?
    let artworkUrl60, artworkUrl100: String
    let collectionExplicitness: String
    let trackCount: Int
    let copyright, country, currency: String?
    let primaryGenreName: String

}

//    static func example() -> Album {
//
//        Album(wrapperType: "collection", collectionType: "Album", id: 1, artistID: 2, amgArtistID: 3,
//              artistName: "Jack Johnson & Friends",
//              collectionName: "Best of Kokua Festival (A Benefit for the Kokua Hawaii Foundation)", collectionCensoredName: "",
//              artistViewURL: nil, collectionViewURL: "https://music.apple.com/us/album/jack-johnson-friends-best-of-kokua-festival-a/1440752312?uo=4",
//              artworkUrl60: "https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/43/d0/ba/43d0ba6b-6470-ad2d-0c84-171c1daea838/12UMGIM10699.rgb.jpg/60x60bb.jpg",
//              artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/43/d0/ba/43d0ba6b-6470-ad2d-0c84-171c1daea838/12UMGIM10699.rgb.jpg/100x100bb.jpg",
//              collectionPrice: 8.99, collectionExplicitness: "", trackCount: 15, copyright: nil, country: "USA", currency: "USD", releaseDate: "2012-01-01T08:00:00Z", primaryGenreName: "Rock")
//
//    }




