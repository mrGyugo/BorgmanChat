//
//  MainChatField.swift
//  TestChatLibrary
//
//  Created by Viktor Mishustin on 10.08.18.
//  Copyright © 2018 BorgmanLab. All rights reserved.
//

import UIKit

class MainChatField: UIView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var tableView: ColletionViewChat!
    
    let dataSourceChat = DataSourceChat(dateFormatterStyleString: "HH:mm")
    
    
    //MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    private func customInit() {
        Bundle.main.loadNibNamed("MainChatField", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    //MARK: - Public
    func updateMessages(_ messages: [MessageProtocol]) {
        dataSourceChat.updeteMessages(messages)
        tableView.reloadData()
    }

}



extension MainChatField: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSourceChat.sections()
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceChat.rowsInSection(section)
    }
    
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainChatCell", for: indexPath) as! MainChatFieldCell
        let message = dataSourceChat.getMessageAtIndexPath(indexPath)
        cell.setMessage(message)
        return cell
    }


    
    
}




