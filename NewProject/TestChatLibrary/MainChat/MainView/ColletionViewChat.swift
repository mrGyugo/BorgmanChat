//
//  ColletionViewChat.swift
//  TestChatLibrary
//
//  Created by Viktor Mishustin on 10.08.18.
//  Copyright © 2018 BorgmanLab. All rights reserved.
//

import UIKit

class ColletionViewChat: UITableView {
    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        customInit()
    }

    
    private func customInit() {
        register(UINib(nibName: "MainChatFieldCell", bundle: nil), forCellReuseIdentifier: "MainChatCell")
    }

    
}
