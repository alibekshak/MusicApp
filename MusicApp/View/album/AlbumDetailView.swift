import SwiftUI

struct AlbumDetailView: View {

    var album: Album

    @ObservedObject var songsViewModel: SongForAlbumViewModel

        init(album: Album) {
            self.album = album
            self._songsViewModel = ObservedObject(wrappedValue: SongForAlbumViewModel(albumID: album.id))
        }

    var body: some View {
        VStack{
            AlbumForDetailView(album: album)
                .padding([.bottom, .horizontal])

            if songsViewModel.state == .isLoading{
                ProgressView()
                    .progressViewStyle(.circular)
            } else if songsViewModel.songs.count > 0 {
                SongsInAlbumView(songsViewModel: songsViewModel)
            }
        }
        .onAppear {
            print("albumID - \(album.id)")
            songsViewModel.fetch()
        }
        .onReceive(songsViewModel.$state) { state in
            if case let .error(error) = state {
                print("Error: \(error)")
            }
        }
    }
}




//struct SongsView: View{
//    let songs: [Song]
//    let selectedSong: Song?
//
//    var body: some View{
//        VStack{
//            ForEach(songs) { song in
////                NavigationLink(destination: WebView(urlString: song.previewURL ?? "")){
//                    HStack{
////                        ImageLoadingView(urlString: song.artworkUrl60, size: 60)
//
//                        VStack(alignment: .leading){
//                            Text(song.trackName ?? "")
//                                .font(.headline)
//                                .truncationMode(.tail)
//                            Text(song.artistName + " - " + song.collectionName!)
//                                .font(.caption)
//                                .foregroundColor(.gray)
//                        }
//                        .lineLimit(1)
//                    }
//                    .foregroundColor(selectedSong?.id == song.id ? Color.accentColor : Color.black)
//                    .id(song.trackNumber)
//
////                }
//            }
//        }
//    }
//}



