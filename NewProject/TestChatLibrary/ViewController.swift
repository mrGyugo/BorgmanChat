//
//  ViewController.swift
//  TestChatLibrary
//
//  Created by Viktor Mishustin on 10.08.18.
//  Copyright © 2018 BorgmanLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainChatField: MainChatField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainChatField.updateMessages(TempArray.customTempArray)
    }

}

