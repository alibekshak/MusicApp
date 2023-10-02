import SwiftUI

struct SearchView: View {
    
    @State private var searchTerm: String = ""
    @State private var showButtons: Bool = true
    @State private var imageLoadingStates: [String: Bool] = [:]
    @State private var albumResults: [Album] = []
    @State private var musicResults: [SongResults] = []
    
    var body: some View {
        NavigationView{
            VStack{
               TextForSearch()
                    .font(.largeTitle)
                SearchBar(searchTerm: $searchTerm, showButtons: $showButtons, onCommit: performSearch)
                
                if searchTerm.count == 0{
                    PlaceholderView(searchTerm: $searchTerm, showButtons: $showButtons, searchMusic: performSearch)
                        .frame(maxHeight: .infinity)
                }else{
                    
                    ScrollView(.vertical){
                        
                        SongRowView(musicResults: $musicResults)
                        
                        Divider()
                        
                        AlbumRowView(albumResults: $albumResults)
                        
                    }
                }
            }
        }
    }
    private func performSearch() {
        searchAlbum()
        searchMusic()
    }
    
    private func searchAlbum() {
        imageLoadingStates.removeAll()
        NetworkManagerAlbum.shared.fetchAlbum(for: searchTerm, entity: "album") { result in
            if let album = result {
                self.albumResults = album
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
