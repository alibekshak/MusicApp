import SwiftUI

struct ContentView: View {
    @State private var searchTerm: String = ""
    @State private var musicResults: [ItunesMusic] = []

    var body: some View {
        VStack {
            Text("iTunes Music Search")
                .font(.title)
                .padding()
            
            TextField("Search for music", text: $searchTerm, onCommit: searchMusic)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            List(musicResults, id: \.trackName) { music in
                VStack(alignment: .leading) {
                    Text(music.trackName ?? "")
                        .font(.headline)
                    Text(music.artistName)
                        .font(.subheadline)
                }
            }
            .onAppear(perform: searchMusic)
        }
        .padding()
    }

    private func searchMusic() {
        NetworkManager.shared.fetchMusic(for: searchTerm) { result in
            if let music = result {
                self.musicResults = music
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
