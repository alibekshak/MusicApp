import Foundation

struct Auxiliary{
    
    struct NetworkAuxiliary{
        var baseURL = "https://itunes.apple.com/search"
    }
    
    struct NetworkAuxiliaryForSongAlbum{
        var baseURL = "https://itunes.apple.com/lookup"
    }
    
    struct TextForTabView{
        var nameForSearch = "Search"
        var imageForSearch = "magnifyingglass"
        var nameForAlbum = "Album"
        var imageForAlbum = "music.note.list"
        var nameForSong = "Song"
        var imageForSong = "music.note"
    }
    
    struct TextForEntity{
        var entitySong = "song"
        var entityAlbum = "album"
    }
    
    struct TextForSearchBar{
        var textSearch = "Search for music"
        var cancel = "Cancel"
    }
    
    struct TextForPlaceholder{
        var textPlaceholder = "Trending"
    }
}


