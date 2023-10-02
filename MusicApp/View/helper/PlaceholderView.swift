//
//  PlaceholderView.swift
//  MusicApp
//
//  Created by Apple on 28.09.2023.
//

import SwiftUI

struct PlaceholderView: View {
    
    @Binding var searchTerm: String
    @Binding var showButtons: Bool
    
    let suggestion = ["Eminem", "KOLEO", "Drake"]
    var searchMusic: () -> Void
    
    var body: some View {
        VStack(spacing: 15){
            Text("Trending")
                .font(.title)
            ForEach(suggestion, id: \.self){ text in
                Button{
                    searchTerm = text
                    searchMusic()
                    showButtons = false
                } label: {
                    Text(text)
                }
            }
        }
    }
}

