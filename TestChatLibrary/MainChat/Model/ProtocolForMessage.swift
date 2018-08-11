//
//  ProtocolForMessage.swift
//  TestChatLibrary
//
//  Created by Мишустин Сергеевич on 11.08.2018.
//  Copyright © 2018 BorgmanLab. All rights reserved.
//

import Foundation

protocol MessageProtocol {
    
    var message: String { get }
    var createDate: Date { get }
    
    init(message: String, createDate: Date)

}
