import SwiftUI

struct AlbumListView: View {
    
    @State private var searchTerm: String = ""
    @State private var showButtons: Bool = true
    @State private var imageLoadingStates: [String: Bool] = [:]
    @State private var albumResults: [Album] = []
   
    var body: some View {
        VStack{
            Text("Albums")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            SearchBar(searchTerm: $searchTerm, showButtons: $showButtons, onCommit: searchAlbum)
            
            if searchTerm.count == 0 {
                PlaceholderView(searchTerm: $searchTerm, showButtons: $showButtons, searchMusic: searchAlbum)
                    .frame(maxHeight: .infinity)
            }else{
                List{
                    ForEach(albumResults, id: \.collectionName) { album in
                        HStack{
                            ImageLoadingView(urlString: album.artworkUrl100, size: 100)
                            
                            VStack(alignment: .leading){
                                Text(album.collectionName!)
                                Text(album.artistName!)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .lineLimit(1)
                        }
//                        .padding(.leading)
                    }
                }
                .listStyle(.plain)
            }
        }
    }
    
    private func searchAlbum() {
        imageLoadingStates.removeAll()
        NetworkManagerAlbum.shared.fetchAlbum(for: searchTerm, entity: "album") { result in
            if let music = result {
                self.albumResults = music
            }
        }
    }

}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
