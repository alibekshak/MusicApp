//
//import SwiftUI
//
//struct AlbumRowView: View {
//
//    @Binding var albumResults: [Album]
//
//    var body: some View {
//        LazyVStack(alignment: .leading){
//           TextForAlbums()
//                .font(.headline)
//
//            ForEach(albumResults) { album in
//                NavigationLink(destination: AlbumDetailView(album: album)){
//                    HStack{
//                        ImageLoadingView(urlString: album.artworkUrl100, size: 100)
//
//                        VStack(alignment: .leading){
//                            Text(album.collectionName!)
//                            Text(album.artistName!)
//                                .font(.caption)
//                                .foregroundColor(.gray)
//                        }
//                        .lineLimit(1)
//                    }
//                    .padding(.leading)
//                }
//            }
//        }
//    }
//}
//
