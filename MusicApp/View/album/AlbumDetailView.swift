//import SwiftUI
//
//struct AlbumDetailView: View {
//
//    var album: Album
//
//    @State private var musicResults: [SongResults] = []
//    @State private var imageLoadingStates: [String: Bool] = [:]
//
//    var body: some View {
//       AlbumForDetailView(album: album)
//        .padding()
//
//        List{
//            ForEach(musicResults, id: \.trackName) { song in
//                NavigationLink(destination: WebView(urlString: song.previewUrl ?? "")){
//                    HStack{
//                        ImageLoadingView(urlString: song.artworkUrl60, size: 60)
//                        
//                        VStack(alignment: .leading){
//                            Text(song.trackName!)
//                                .font(.headline)
//                                .truncationMode(.tail)
//                            Text(song.artistName + " - " + song.collectionName!)
//                                .font(.caption)
//                                .foregroundColor(.gray)
//                        }
//                        .lineLimit(1)
//                    }
//                }
//            }
//        }
//        .listStyle(.plain)
//        .onAppear {
//            searchSong()
//        }
//    }
//
//    private func searchSong() {
//        imageLoadingStates.removeAll()
//        NetworkManagerSongAlbum.shared.fetchSongs(forAlbumId: String(album.collectionId), entity: Auxiliary.TextForEntity().entitySong){ result in
//            switch result {
//            case .success(let song):
//                let filteredSongs = song.filter { $0.trackName != nil }
//                self.musicResults = filteredSongs
//            case .failure(let error):
//                print("\(error)")
//            }
//        }
//    }
//
//}
//
//
