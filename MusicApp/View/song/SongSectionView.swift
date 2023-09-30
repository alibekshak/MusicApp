////
////  SongSectionView.swift
////  MusicApp
////
////  Created by Apple on 30.09.2023.
////
//
//import SwiftUI
//
//struct SongSectionView: View {
//
//    let song: [SongResults]
//    let rows = Array(repeating: GridItem(.fixed(60), spacing: 0, alignment: .leading), count: 4)
//
//    var body: some View {
//        ScrollView(.horizontal){
//            LazyHGrid(rows: rows){
//
//                ForEach(song) { song in
//                    SongRowView(song: song)
//                        .frame(width: 300)
//                }
//            }
//        }
//    }
//}
//
//struct SongSectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        SongSectionView(song: [SongResults.example()])
//    }
//}
