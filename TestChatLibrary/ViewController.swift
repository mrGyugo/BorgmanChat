//
//  ViewController.swift
//  TestChatLibrary
//
//  Created by Viktor Mishustin on 10.08.18.
//  Copyright © 2018 BorgmanLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var mainChatField: MainChatField!
    @IBOutlet weak var inputTextView: InputTextView!
    @IBOutlet weak var heightInputTextView: NSLayoutConstraint!
    
    //MARK: - Properties
    
    
    //MARK: - Constraints
    @IBOutlet weak var bottomInputTextConstraint: NSLayoutConstraint!
    
    
    //MARK: - Controller life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Notifications
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyBoardUp(notification :)),
                                               name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyBoardDown(notification :)),
                                               name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        //MainChatView---------
        mainChatField.updateMessages(TempArray.customTempArray)
        mainChatField.hideKeyboard { [weak self] in
            guard let this = self else { return }
            this.view.endEditing(true)
        }
        
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
    
    //MARK: - Notification Actions
    @objc func keyBoardUp(notification: NSNotification){
        let rect = notification.userInfo?["UIKeyboardBoundsUserInfoKey"] as! CGRect
        bottomInputTextConstraint.constant = rect.size.height
        mainChatField.changeOffset(CGPoint(x: mainChatField.tableViewOffset.x, y: mainChatField.tableViewOffset.y + rect.size.height), withAnimation: false)
        UIView.animate(withDuration: notification.userInfo?["UIKeyboardAnimationDurationUserInfoKey"] as! TimeInterval, animations: { [weak self] in
            guard let this = self else { return }
            this.view.layoutIfNeeded()
            this.mainChatField.layoutIfNeeded()
        })
    }
    
    @objc func keyBoardDown(notification: NSNotification){
        bottomInputTextConstraint.constant = 0
        UIView.animate(withDuration: notification.userInfo?["UIKeyboardAnimationDurationUserInfoKey"] as! TimeInterval) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
    
    
}




