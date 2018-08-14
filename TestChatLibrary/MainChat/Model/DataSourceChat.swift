//
//  DataSourceChatField.swift
//  TestChatLibrary
//
//  Created by Мишустин Сергеевич on 11.08.2018.
//  Copyright © 2018 BorgmanLab. All rights reserved.
//

import Foundation


final class DataSourceChat {
    
    private var messages: [Message] = []
    private var sections: [String] = []
    
    private var dateFormatter = DateFormatter()
    
    required init(dateFormatterStyleString: String) {
        self.dateFormatter.dateFormat = dateFormatterStyleString
    }
    
    var indexSet: IndexSet {
        return IndexSet(integersIn: sections.count - 1...sections.count - 1)
    }
    
    var count: Int {
        get { return messages.count }
    }
    
    var sectionsCount: Int {
        get { return sections.count }
    }
    
    var lastMessage: IndexPath {
        get {
            let mesages = messagesFromSection(sections.count - 1)
            return IndexPath(row: mesages.count - 1, section: sections.count - 1)
        }
    }
    
    
    func rowsCountInSection(_ section: Int) -> Int {
        return messagesFromSection(section).count
    }
    
    func titleStringInSection(_ section: Int) -> String {
        return sections[section]
    }
    
    @discardableResult
    func addMessage(_ message: Message) -> (indexPath: IndexPath, needUpdateSection: Bool) {
        var needUpdateSection = false
        messages.append(message)
        if sections.count == 0 || sections.last != convertDatetoString(message.createDate) {
            sections.append(convertDatetoString(message.createDate))
            needUpdateSection = true
        }
        let mesages = messagesFromSection(sections.count - 1)
        return (IndexPath(row: mesages.count - 1, section: sections.count - 1), needUpdateSection)
    }
    
    func getMessageAtIndexParh(_ indexPath: IndexPath) -> Message {
        return messagesFromSection(indexPath.section)[indexPath.row]
    }
    
}


extension DataSourceChat {
    
    private func convertDatetoString(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    private func messagesFromSection(_ section: Int) -> [Message] {
        return messages.filter { convertDatetoString($0.createDate) == sections[section] }
    }
    
}




extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
