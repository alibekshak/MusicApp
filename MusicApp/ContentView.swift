import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
//            SearchView()
//                .tabItem{
//                    Label(Auxiliary.TextForTabView().nameForSearch, systemImage: Auxiliary.TextForTabView().imageForSearch)
//                }
//            AlbumListView()
            AlbumSearchView()
                .tabItem{
                    Label(Auxiliary.TextForTabView().nameForAlbum, systemImage: Auxiliary.TextForTabView().imageForAlbum)
                }
            SongSearchView()
                .tabItem{
                    Label(Auxiliary.TextForTabView().nameForSong, systemImage: Auxiliary.TextForTabView().imageForSong)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
