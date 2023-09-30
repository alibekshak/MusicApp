import SwiftUI

struct SongRowView: View {
    
    @Binding var musicResults: [SongResults]
    let rows = Array(repeating: GridItem(.fixed(60), spacing: 5, alignment: .leading), count: 4)
    
    
    var body: some View {
        LazyVStack(alignment: .leading){
            
            Text("Songs")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHGrid(rows: rows, spacing: 15){
                    ForEach(musicResults, id: \.previewUrl) { song in
                            HStack{
                                ImageLoadingView(urlString: song.artworkUrl60, size: 60)
                                VStack(alignment: .leading){
                                    Text(song.trackName!.prefix(15) + "...")
                                        .font(.headline)
                                        .truncationMode(.tail)
                                    Text(song.artistName)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .lineLimit(1)
                            }
                            .padding()
                            
                    }

                }
                .padding([.horizontal, .bottom])
            }
        }
    }
}


//struct SongRowView_Previews: PreviewProvider{
//
//
//    static var previews: some View{
//        NavigationView{
//            SongRowView()
//        }
//    }
//}
