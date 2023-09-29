import SwiftUI

struct SearchBar: View {
    @Binding var searchTerm: String
    @Binding var showButtons: Bool
    var onCommit: () -> Void

    var body: some View {
        TextField("Search for music", text: $searchTerm, onCommit: onCommit)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding()
            .background(Color.white)
    }
}
