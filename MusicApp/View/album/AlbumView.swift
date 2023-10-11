//
//  AlbumView.swift
//  MusicApp
//
//  Created by Apple on 11.10.2023.
//

import SwiftUI

struct AlbumView: View {
    
    @StateObject var viewModel = AlibumListViewModel()
    
    var body: some View {
        NavigationView{
            List(viewModel.albums){ album in
                Text(album.collectionName)
                Text(album.artistName)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .searchable(text: $viewModel.searchTerm)
        
        }
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
    }
}
