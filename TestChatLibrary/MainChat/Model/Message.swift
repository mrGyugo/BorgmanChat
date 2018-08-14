//
//  Message.swift
//  TestChatLibrary
//
//  Created by Мишустин Сергеевич on 11.08.2018.
//  Copyright © 2018 BorgmanLab. All rights reserved.
//

import Foundation

struct Message: Hashable, CustomStringConvertible {
    var description: String {
        return message
    }
    
    
    let message: String
    let createDate: Date
    
    init(message: String, createDate: Date) {
        self.message = message
        self.createDate = createDate
    }
    
    var hashValue: Int {
        return (message + "\(createDate)").hashValue
    }
    
    
    
}
