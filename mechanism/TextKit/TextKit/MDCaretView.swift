//
//  MDCaretView.swift
//  TextKit
//
//  Created by zhangguang on 17/3/6.
//  Copyright © 2017年 com.Tech. All rights reserved.
//

import UIKit
import Foundation

class MDCaretView: UIView{
    let blinkDuration  = 0.5
    var caretTimer: Timer?
    var caretBlinks: Bool = true{
        didSet{
            if caretBlinks{
                self.caretTimer = Timer.scheduledTimer(timeInterval: blinkDuration, target: self, selector: Selector(("doBlink")), userInfo: nil, repeats: true)
            }
            else{
                self.caretTimer?.invalidate()
                self.caretTimer = nil
            }
        }
    }
    
//     init(){
//        self.caretTimer = Timer.scheduledTimer(timeInterval: blinkDuration, target: self, selector: Selector(("hahah:")), userInfo: nil, repeats: true)
//        super.init()
//    }
    override init(frame: CGRect){
//        self.caretBlinks = true
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
//        self.caretBlinks = true
        super.init(coder: aDecoder)
    }
    
    private func doBlink(){
        
    }
}
