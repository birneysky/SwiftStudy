//: Playground - noun: a place where people can play

import UIKit

/*struct Location{
    let latitude: Double
    let longitude: Double
}

let appleHeadQuarterLocation = Location(latitude: 37.3230, longitude: -122.0322)

let googleHeadQuarterLocation = Location(latitude: 37.4220, longitude: -122.0841)

appleHeadQuarterLocation.latitude
appleHeadQuarterLocation.longitude

//googleHeadQuarterLocation.latitude = 0;
googleHeadQuarterLocation.longitude

var appleHeadQuarterLocation1 = Location(latitude: 37.3230, longitude: -122.0322)

appleHeadQuarterLocation1 = googleHeadQuarterLocation
//appleHeadQuarterLocation1.latitude = 0;
appleHeadQuarterLocation1

struct Place{
    let location:Location
    var name: String
}

var place = Place(location: appleHeadQuarterLocation1, name: "谷歌总部")

place.location.latitude
place.location.longitude
place.name*/


/// 结构体构造函数
/*
struct Location{
    let latitude: Double
    let longitude: Double
    var placeName: String?
    /// "5,6"
    init(coordinateString: String){
        let commaIndex = coordinateString.range(of: ",")!
        let firstElement = coordinateString.substring(to: commaIndex.lowerBound)
        let secondElement = coordinateString.substring(from: commaIndex.upperBound)
        
        self.latitude = Double(firstElement)!
        self.longitude = Double(secondElement)!
        
    }
    
    init(latitude: Double, longitude:Double){
        self.latitude = latitude
        self.longitude = longitude
    }
    
 
}

let location = Location(coordinateString: "37.32306,-122.0322")

location.longitude
location.latitude

let location1 = Location(coordinateString: "3,4")
location1.latitude
location1.longitude

let location2 = Location(latitude: 23.3, longitude: 45.9)
location2.latitude
location2.longitude
location2.placeName */


/// 可失败的构造函数

struct Location{
    let latitude: Double
    let longitude: Double
    var placeName: String?
    /// 使用 Failable Initializer
    /*init?(coordinateString: String){
        if let commaIndex = coordinateString.range(of: ","){
            if let firstElement = Double(coordinateString.substring(to: commaIndex.lowerBound)){
                if let secondElement = Double(coordinateString.substring(from: commaIndex.upperBound)){
                    
                    self.latitude = firstElement
                    self.longitude = secondElement
                }
                else{
                    return nil
                }
            }
            else{
                return nil
            }
        }
        else{
            return nil
        }
    }*/
    /// 使用 Failable Initializer
    init?(coordinateString: String){
        /*guard let commaIndex = coordinateString.range(of: ",") else {
            return nil
        }
        
        guard  let firstElement = Double(coordinateString.substring(to: commaIndex.lowerBound)) else{
            return nil
        }
        
        guard let secondElement = Double(coordinateString.substring(from: commaIndex.upperBound)) else {
            return nil
        }*/
        
        guard let commaIndex = coordinateString.range(of: ","),
              let firstElement = Double(coordinateString.substring(to: commaIndex.lowerBound)),
              let secondElement = Double(coordinateString.substring(from: commaIndex.upperBound)) else {
            return nil
        }
        
        self.latitude = firstElement
        self.longitude = secondElement

    }
    
    init(latitude: Double, longitude:Double){
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func printLocation(){
        print("the location is \(self.latitude),\(self.longitude)")
    }
    
    func locatinDescription() -> String{
        return "\(self.latitude),\(self.longitude)"
    }
    
    /// 是否在北半球
    func isNorth() -> Bool{
        return self.latitude > 0
    }
    
    func isSouth() -> Bool{
        return !self.isNorth()
    }
    
    func distanceTo(location: Location) -> Double{
        return sqrt(pow(self.latitude - location.latitude, 2) + pow(self.longitude - location.longitude, 2))
    }
}

let location = Location(coordinateString: "37.32306,-122.0322")
location?.latitude
location?.longitude
location?.printLocation()
location?.locatinDescription()

let googleHeadQuarterLocation = Location(latitude: 37.4220, longitude: -122.0841)
location?.distanceTo(location: googleHeadQuarterLocation)
googleHeadQuarterLocation.isNorth()
location?.isSouth()


/// 结构体,枚举是值类型   value type  Array Dictionary Set 这三种类型，都是使用struct定义的

/// 复制相当于拷贝

struct Point{
    var x = 0
    var y = 0
}

var p1 = Point(x: 20, y: 30)
var p2 = Point()
p2.x += 1

p2 = p1

p2.x
p2.y

enum Direction{
    case North
    case South
    case East
    case West
}

var d1 = Direction.North
var d2: Direction = .South
d1 = d2
d1

/// 结构体在swift中占据了举足轻重的地位
/// Array Dictionary Set 都是结构体
/// Int Float Double Bool String 也是结构体


var a:Int = 1
a.distance(to: 100)

var array = [2,8,1,6,9,5]
array.append(4)
array.count
Int.max
