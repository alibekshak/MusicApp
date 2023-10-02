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
                
                SearchBar(searchTerm: $searchTerm, showButtons: $showButtons, onCommit: searchSong)
                
                if searchTerm.count == 0{
                    
                    PlaceholderView(searchTerm: $searchTerm, showButtons: $showButtons, searchMusic: searchSong)
                        .frame(maxHeight: .infinity)
                }else{
                    List{
                        ForEach(musicResults, id: \.previewUrl) { song in
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
                }
            }
        }
    }
    
    private func searchSong() {
        imageLoadingStates.removeAll()
        
        NetworkManager.shared.fetchMusic(for: searchTerm, entity: Auxiliary.TextForEntity().entitySong) { response in
            switch response {
            case .success(let music):
                self.musicResults = music
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView()
    }
}
