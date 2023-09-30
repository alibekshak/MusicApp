import SwiftUI

struct SearchBar: View {
    @Binding var searchTerm: String
    @Binding var showButtons: Bool
    var onCommit: () -> Void

    var body: some View {
        HStack(spacing: 1) {
            TextField("Search for music", text: $searchTerm, onCommit: onCommit)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding([.leading, .trailing])
                .background(Color.white)

            if !searchTerm.isEmpty {
                Button(action: {
                    searchTerm = ""
                    hideKeyboard()
                }) {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                .padding(.trailing, 10)
            }
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
