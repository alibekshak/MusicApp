import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            SearchView()
                .tabItem{
                    Label("Search", systemImage: "magnifyingglass")
                }
            AlbumListView()
                .tabItem{
                    Label("Album", systemImage: "music.note")
                }
            SongListView()
                .tabItem{
                    Label("Song", systemImage: "music.note")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
