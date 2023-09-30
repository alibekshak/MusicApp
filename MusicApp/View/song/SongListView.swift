import SwiftUI

struct SongListView: View {
    
    @State private var searchTerm: String = ""
    @State private var musicResults: [SongResults] = []
    @State private var imageLoadingStates: [String: Bool] = [:]
    @State private var showButtons: Bool = true
    
    var body: some View {
        VStack {
            Text("Songs")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            SearchBar(searchTerm: $searchTerm, showButtons: $showButtons, onCommit: searchMusic)
            
            if searchTerm.count == 0{

                PlaceholderView(searchTerm: $searchTerm, showButtons: $showButtons, searchMusic: searchMusic)
                    .frame(maxHeight: .infinity)
            }else{
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(musicResults, id: \.trackName) { music in
                            VStack {
                                AsyncImage(url: URL(string: music.artworkUrl100))
                                    .frame(width: 100, height: 100)
                                Text(music.trackName ?? "")
                                    .font(.headline)
                                Text(music.artistName)
                                    .font(.subheadline)
                            }
                            .padding()
                        }
                    }
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
