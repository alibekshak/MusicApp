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
                .padding(.top, -30)
            
            SongsInAlbumView(songsViewModel: songsViewModel)
            
        }
        .onAppear {
            print("onAppear albumID - \(album.id)")
            songsViewModel.fetch()
        }
    }
}


