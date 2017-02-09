//: Playground - noun: a place where people can play

import UIKit

struct Location{
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
