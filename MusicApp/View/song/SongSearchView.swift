//
//  SongSearchView.swift
//  MusicApp
//
//  Created by Apple on 18.10.2023.
//

import SwiftUI

struct SongSearchView: View {
    
    @StateObject var viewModel = SongListViewModel()
    
    var body: some View {
        NavigationView{
            Group{
                if viewModel.searchTerm.isEmpty{
                    PlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    SongView(viewModel: viewModel)
                }
            }
        }
        .searchable(text: $viewModel.searchTerm)
        .navigationTitle("Song")
    }
}

struct SongSearchView_Previews: PreviewProvider {
    static var previews: some View {
        SongSearchView()
    }
}
