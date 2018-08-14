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
    @IBOutlet weak var inputTextView: InputTextView!
    @IBOutlet weak var heightInputTextView: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MainChatView---------
        mainChatField.updateMessages(TempArray.customTempArray)
        
        //InputTextView--------------
        inputTextView.addMessage { [weak self] message in
            guard let this = self else { return }
            this.mainChatField.insertMessage(message)
        }
        inputTextView.changeHeightText { [weak self] height  in
            guard let this = self else { return }
            this.heightInputTextView.constant = height + 16
            this.mainChatField.scrollTableViewInBotton()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layoutIfNeeded()
        mainChatField.scrollTableViewInBotton()
    }

    
}

