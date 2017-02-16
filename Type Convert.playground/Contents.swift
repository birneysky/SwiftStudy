//: Playground - noun: a place where people can play

import UIKit


var color: UIColor = UIColor.white


var float:Float = 1.2
var  y: Int = Int(float)

///程序运行中怎么检查变量的类型

class MediaItem{
    var name: String
    init(name: String) {
        self.name = name
    }
}


class Movie: MediaItem{
    var genre: String
    
    init(name: String, genre: String){
        self.genre = genre
        super.init(name: name)
    }
}

class Music: MediaItem{
    var artist: String
    init(name: String, artistName: String){
        self.artist = artistName
        super.init(name: name)
    }
}

class Game: MediaItem{
    var developer: String
    init(name: String, developer: String){
        self.developer = developer
        super.init(name: name)
    }
}


let library: [MediaItem] = [Movie(name: "Zootopia", genre: "Animation"),
                            Music(name: "Hello", artistName: "Adele"),
                            Game(name: "LIMBO", developer: "Playdead"),
                            Music(name: "See you agian", artistName: "Wiz Khalifa"),
                            Game(name: "The Brige", developer: "The Quantum Astrophysicists Guild")]


var musicCount = 0
var movieCount = 0
var gameCount = 0

for item in library{
  
    if item is Movie{
        movieCount += 1
    }
    else if item is Music{
        musicCount += 1
    }
    else if item is Game{
        gameCount += 1
    }
}

///类型转化，失败返回nil
let moviewItem = library[0] as? Music

musicCount
movieCount
gameCount


for item in library{
    
    if item is Movie{
        movieCount += 1
        ///强制转化
        let moviewItem = item as! Movie
    }
    else if item is Music{
        musicCount += 1
    }
    else if item is Game{
        gameCount += 1
    }
}



for item in library{
    /// 尝试类型转化并且解包
    if let movie = item as? Movie{
        print("Movie:",movie.name,"Genre:",movie.genre)
    }
    else if let music = item as? Music{
        print("Music:",music.name,"artist:",music.artist)
    }
    else if let game = item as? Game{
        print("Game:",game.name,"deveoper:",game.developer)
    }
}


