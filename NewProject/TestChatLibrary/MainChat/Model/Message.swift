//
//  Message.swift
//  TestChatLibrary
//
//  Created by Мишустин Сергеевич on 11.08.2018.
//  Copyright © 2018 BorgmanLab. All rights reserved.
//

import Foundation

struct Message: MessageProtocol {
    
    let message: String
    let createDate: Date
    
    init(message: String, createDate: Date) {
        self.message = message
        self.createDate = createDate
    }
    
    public static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.message == rhs.message && lhs.createDate == rhs.createDate
    }
}
