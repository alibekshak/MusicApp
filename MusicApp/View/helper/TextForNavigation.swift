//
//  TextForNavigation.swift
//  MusicApp
//
//  Created by Apple on 02.10.2023.
//

import SwiftUI

struct TextForSearch: View {
    var body: some View {
        Text("Search")
//            .font(.largeTitle)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}


struct TextForSongs: View {
    var body: some View {
        Text("Songs")
//            .font(.largeTitle)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}


struct TextForAlbums: View{
    var body: some View{
        Text("Albums")
//            .font(.largeTitle)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}
