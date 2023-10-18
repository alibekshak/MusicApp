//import SwiftUI
//
//struct SearchView: View {
//    
//    @State private var searchTerm: String = ""
//    @State private var showButtons: Bool = true
//    @State private var imageLoadingStates: [String: Bool] = [:]
//    @State private var albumResults: [Album] = []
//    @State private var musicResults: [SongResults] = []
//    
//    
//    var body: some View {
//        NavigationView{
//            VStack{
//               TextForSearch()
//                    .font(.largeTitle)
//                
//                SearchBar(searchTerm: $searchTerm, showButtons: $showButtons, onCommit: performSearch)
//
//                if searchTerm.count == 0{
//                    PlaceholderView(searchTerm: $searchTerm)
//                        .frame(maxHeight: .infinity)
//                }else{
//                    ScrollView(.vertical){
//                        
//                        SongRowView(musicResults: $musicResults)
//                            .foregroundColor(.black)
//                        
//                        Divider()
//                        
////                        AlbumRowView(albumResults: $albumResults)
//                            .foregroundColor(.black)
//                    }
//                }
//            }
//        }
//    }
//    
//    private func performSearch() {
//        searchAlbum()
//        searchSong()
//    }
//    
//    private func searchAlbum() {
//        imageLoadingStates.removeAll()
//        NetworkManagerAlbum.shared.searchTerm = searchTerm
//        NetworkManagerAlbum.shared.fetchAlbum(entity: Auxiliary.TextForEntity().entityAlbum) { result in
//            switch result{
//            case .success(_):
//                    print("(album)")
//            case .failure(let error):
//                print("\(error)")
//            }
//        }
//    }
//    
//    private func searchSong() {
//        imageLoadingStates.removeAll()
//       
//        NetworkManager.shared.fetchMusic(for: searchTerm, entity: Auxiliary.TextForEntity().entitySong) { response in
//            switch response {
//            case .success(let music):
//                self.musicResults = music
//            case .failure(let error):
//                print("\(error)")
//            }
//        }
//    }
//}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
