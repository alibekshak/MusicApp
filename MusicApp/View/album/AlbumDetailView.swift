import SwiftUI

struct AlbumDetailView: View {
    
    var album: Album
    
    @State private var musicResults: [SongResults] = []
    @State private var imageLoadingStates: [String: Bool] = [:]
    
    var body: some View {
        HStack{
            ImageLoadingView(urlString: album.artworkUrl100, size: 100)

            VStack(alignment: .leading){
                Text(album.collectionName!)
                Text(album.artistName!)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)

                Text(album.primaryGenreName)
                Text("\(album.trackCount) songs" )
            }
            .lineLimit(1)
            Spacer()
        }
        .padding()
        List{
            ForEach(musicResults, id: \.trackName) { song in
                NavigationLink(destination: WebView(urlString: song.previewUrl ?? "")){
                    HStack{
                        ImageLoadingView(urlString: song.artworkUrl60, size: 60)
                        
                        VStack(alignment: .leading){
                            Text(song.trackName!)
                                .font(.headline)
                                .truncationMode(.tail)
                            Text(song.artistName + " - " + song.collectionName!)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .lineLimit(1)
                    }
                }
            }
        }
        .listStyle(.plain)
        .onAppear {
            searchSong()
        }
    }
    
    private func searchSong() {
        imageLoadingStates.removeAll()
        NetworkManagerSongAlbum.shared.fetchSongs(forAlbumId: String(album.collectionId), entity: Auxiliary.TextForEntity().entitySong){ result in
            switch result {
            case .success(let song):
                let filteredSongs = song.filter { $0.trackName != nil }
                self.musicResults = filteredSongs
            case .failure(let error):
                print("\(error)")
            }
        }
    }

}


