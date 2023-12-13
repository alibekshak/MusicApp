//
//  AlbumSearchView.swift
//  MusicApp
//
//  Created by Apple on 18.10.2023.
//

import SwiftUI

struct AlbumSearchView: View {
    
    @StateObject var viewModel = AlbumListViewModel()
    
    
    var body: some View {
        NavigationView{
            Group{
                if viewModel.searchTerm.isEmpty{
                    PlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    AlbumView(viewModel: viewModel)
                }
            }
        }
        .searchable(text: $viewModel.searchTerm)
        .navigationTitle("Album")
    }
}

struct AlbumSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchView()
    }
}
