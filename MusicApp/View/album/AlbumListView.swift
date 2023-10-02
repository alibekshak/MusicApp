import SwiftUI

struct AlbumListView: View {

    @State private var searchTerm: String = ""
    @State private var showButtons: Bool = true
    @State private var imageLoadingStates: [String: Bool] = [:]
    @State private var albumResults: [Album] = []

    var body: some View {
        NavigationView{
            VStack{
                TextForAlbums()
                    .font(.largeTitle)
                
                SearchBar(searchTerm: $searchTerm, showButtons: $showButtons, onCommit: searchAlbum)
                
                if searchTerm.count == 0 {
                    PlaceholderView(searchTerm: $searchTerm, showButtons: $showButtons, searchMusic: searchAlbum)
                        .frame(maxHeight: .infinity)
                }else{
                    List{
                        ForEach(albumResults, id: \.artworkUrl60) { album in
                            NavigationLink(destination: AlbumDetailView(album: album)){
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
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
    }

    private func searchAlbum() {
        imageLoadingStates.removeAll()
        NetworkManagerAlbum.shared.fetchAlbum(for: searchTerm, entity: Auxiliary.TextForEntity().entityAlbum) { result in
            if let album = result {
                self.albumResults = album
            }
        }
    }

}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
