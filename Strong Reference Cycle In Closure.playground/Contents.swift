//: Playground - noun: a place where people can play

import UIKit

class Country{
    let name: String
    var capital: City!
    
    init(name: String, capitalName: String) {
        self.name = name
       
        self.capital = City(name: capitalName, country: self)
        print("Country",name,"is being initialized !")
    }
    
    deinit {
        print("Country",name,"is being deinitialized ")
    }
}

class City{
    let name: String
    unowned let country: Country
    
    init(name: String,country: Country) {
        self.name = name
        self.country = country
        print("City", name, "is being initialized")
    }
    
    deinit {
        print("City", name, "is being deinitialized")
    }
    
}


/////闭包引起的循环引用
class SmartAirConditioner{
    var temperature: Int = 26
    var temperatureChange:((Int)->())!
    
    init(){
        temperatureChange = { newTemperature in
            if abs(newTemperature - self.temperature) >= 10 {
                print("It's not healthy to do it")
            }
            else{
                self.temperature = newTemperature
                print("New temperate \(newTemperature) is set !")
            }
        }
    }
    
    deinit {
        print("Smart Air-Conditioner is be deinitialized")
    }
}


var airCondition: SmartAirConditioner? = SmartAirConditioner()
airCondition?.temperature
airCondition?.temperatureChange(24)
///修改完闭包后，对象释放了，这是为什么呢
airCondition?.temperatureChange = {newTemperate in
    if newTemperate >= 10 && newTemperate <= 26 {
        airCondition?.temperature = newTemperate
         print("New temperate \(newTemperate) is set !")
    }
    else{
        print("\(newTemperate) is not good temperate")
    }
}

airCondition?.temperatureChange(12)

airCondition = nil

///并不是所有闭包都会循环引用
class ScoreBook{
    var scores: [Int]
    
    init( scores: [Int] ){
        self.scores = scores
        print("ScoreBook  is being initizlized")
    }

    func printScore(){
        scores.map { score  in
            print("==\(score)==")
        }
    }
    
    deinit {
        print("ScoreBook is being deinitialized")
    }
}

let score: [Int] = [100,89,98,45,78,88,67,20,30,100,86]

var scoreBook: ScoreBook? = ScoreBook(scores: score)

//scoreBook?.printScore()

//scoreBook = nil
