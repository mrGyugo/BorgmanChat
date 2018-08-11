//
//  DataSourceChatField.swift
//  TestChatLibrary
//
//  Created by Мишустин Сергеевич on 11.08.2018.
//  Copyright © 2018 BorgmanLab. All rights reserved.
//

import Foundation


final class DataSourceChat {
    
    
    //MARK: - Properties
    private var messages: [MessageProtocol] = [] {
        didSet {
            nomberOfDate(messages: messages)
        }
    }
    private var dateString: [String] = []
    private var dateFormatter = DateFormatter()

    //Initializators
    init(dateFormatterStyleString: String) {
        dateFormatter.dateFormat = dateFormatterStyleString
    }
    
    //MARK: - Gets
    
    func count() -> Int {
        return messages.count
    }
    
    func sections() -> Int {
        return dateString.count
    }
    
    func rowsInSection (_ number: Int) -> Int {
        return filtredMessagedForCreationDate(dateString[number]).count
    }
    
    func getMessageAtIndexPath(_ indexPath: IndexPath) -> MessageProtocol {
        return filtredMessagedForCreationDate(dateString[indexPath.section])[indexPath.row]
    }
    
    //MARK: - Updates
    
    func updeteMessages (_ newMessages: [MessageProtocol]) {
        return messages += newMessages
    }
    
    
    
    //MARK: - Private
    private func nomberOfDate(messages: [MessageProtocol]) {
        dateString = []
        for message in messages {
            if dateString.count > 0 {
                if dateStringFromCreateDate(message.createDate) != dateString.last! {
                    dateString.append(dateStringFromCreateDate(message.createDate))
                }
            } else {
                dateString.append(dateStringFromCreateDate(message.createDate))
            }
        }
    }
    
    
}


extension DataSourceChat {
    
    private func dateStringFromCreateDate(_ createDate: Date) -> String {
        return dateFormatter.string(from: createDate)
    }
    

    private func filtredMessagedForCreationDate(_ creationDate: String) -> [MessageProtocol] {
        return messages.filter{ dateStringFromCreateDate($0.createDate) == creationDate }
    }
    
    private func filtedForDublicate(baseMessages: MessageProtocol, newMessages: MessageProtocol) {
        
    }
    

    
    
}
