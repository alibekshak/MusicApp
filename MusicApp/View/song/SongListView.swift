import SwiftUI

struct SongListView: View {
    
    @State private var searchTerm: String = ""
    @State private var musicResults: [SongResults] = []
    @State private var imageLoadingStates: [String: Bool] = [:]
    @State private var showButtons: Bool = true
    
    var body: some View {
        NavigationView{
            VStack {
                TextForSongs()
                    .font(.largeTitle)
                
                SearchBar(searchTerm: $searchTerm, showButtons: $showButtons, onCommit: searchMusic)
                
                if searchTerm.count == 0{
                    
                    PlaceholderView(searchTerm: $searchTerm, showButtons: $showButtons, searchMusic: searchMusic)
                        .frame(maxHeight: .infinity)
                }else{
                    List{
                        ForEach(musicResults, id: \.trackName) { song in
                            NavigationLink(destination: WebView(urlString: song.previewUrl ?? "No preview")){
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
                }
            }
        }
    }
    
    private func searchMusic() {
        imageLoadingStates.removeAll()
        NetworkManager.shared.fetchMusic(for: searchTerm, entity: "song") { result in
            if let music = result {
                self.musicResults = music
            }
        }
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView()
    }
}
