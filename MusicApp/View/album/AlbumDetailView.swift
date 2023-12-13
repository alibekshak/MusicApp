import SwiftUI

struct AlbumDetailView: View {

    var album: Album

    @StateObject var songsViewModel: SongForAlbumViewModel

    init(album: Album) {
        self.album = album
        self._songsViewModel = StateObject(wrappedValue: SongForAlbumViewModel(albumID: album.id))
    }

    var body: some View {
        VStack{
            AlbumForDetailView(album: album)
                .padding([.bottom, .horizontal])
            
            SongsInAlbumView(songsViewModel: songsViewModel, selectedSong: nil)
            
        }
        .onAppear {
            print("onAppear albumID - \(album.id)")
            songsViewModel.fetch()
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



