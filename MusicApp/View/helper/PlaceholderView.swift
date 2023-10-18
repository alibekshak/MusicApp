//
//  PlaceholderView.swift
//  MusicApp
//
//  Created by Apple on 28.09.2023.
//

import SwiftUI

struct PlaceholderView: View {
    
    @Binding var searchTerm: String
    
    let suggestion = ["Eminem", "KOLEO", "Drake"]
    
    var body: some View {
        VStack(spacing: 15){
            Text(Auxiliary.TextForPlaceholder().textPlaceholder)
                .font(.title)
            ForEach(suggestion, id: \.self){ text in
                Button{
                    searchTerm = text
                } label: {
                    Text(text)
                }
            }
        }
    }
}

