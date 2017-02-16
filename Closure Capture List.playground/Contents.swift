//: Playground - noun: a place where people can play

import UIKit

class SmartAirConditioner{
    var temperature: Int = 26
    ///unowned 不可以用在函数类型
    var temperatureChange:((Int)->())!
    
    init(){
        ///捕获列表
        temperatureChange = { [weak self] newTemperature in
            if let `self` = self {
                if abs(newTemperature - self.temperature) >= 10 {
                    print("It's not healthy to do it")
                }
                else{
                    self.temperature = newTemperature
                    print("New temperate \(newTemperature) is set !")
                }
            }
        }
        
                                 ///捕获列表
//        temperatureChange = { [weak self] newTemperature in
//            if abs(newTemperature - self!.temperature) >= 10 {
//                print("It's not healthy to do it")
//            }
//            else{
//                self!.temperature = newTemperature
//                print("New temperate \(newTemperature) is set !")
//            }
//        }
                                 ///捕获列表
//        temperatureChange = { [unowned self] newTemperature in
//            if abs(newTemperature - self.temperature) >= 10 {
//                print("It's not healthy to do it")
//            }
//            else{
//                self.temperature = newTemperature
//                print("New temperate \(newTemperature) is set !")
//            }
//        }
    }
    
    deinit {
        print("Smart Air-Conditioner is be deinitialized")
    }
}


var airCondition: SmartAirConditioner? = SmartAirConditioner()
airCondition?.temperature
airCondition?.temperatureChange(24)
airCondition = nil




