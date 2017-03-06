//
//  ViewController.swift
//  TextKit
//
//  Created by zhangguang on 17/3/6.
//  Copyright © 2017年 com.Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var layoutView: LayoutView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layoutView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

