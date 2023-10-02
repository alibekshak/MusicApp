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
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}


struct TextForSongs: View {
    var body: some View {
        Text("Songs")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}


struct TextForAlbums: View{
    var body: some View{
        Text("Albums")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}
