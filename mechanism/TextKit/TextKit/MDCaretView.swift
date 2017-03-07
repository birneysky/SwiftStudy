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
    let blinkFadeDuration = 0.2
    var caretTimer: Timer?
    var color: UIColor{
        set{
            self.backgroundColor = newValue
        }
        get{
            return self.backgroundColor ?? self.tintColor
        }
        
    }
    var caretBlinks: Bool = false{
        didSet{
            if caretBlinks{
                self.caretTimer = Timer.scheduledTimer(timeInterval: blinkDuration, target: self, selector: #selector(MDCaretView.doBlink), userInfo: nil, repeats: true)
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
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc private func doBlink(){
        UIView.animate(withDuration: self.blinkFadeDuration, delay: 0, options: .curveEaseInOut, animations: {
            if self.alpha == 0{
                self.alpha = 1
            }else{
                self.alpha = 0
            }
        }, completion: nil)
    }
}
