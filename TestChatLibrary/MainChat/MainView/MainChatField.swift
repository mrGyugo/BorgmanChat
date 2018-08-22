//
//  MainChatField.swift
//  TestChatLibrary
//
//  Created by Viktor Mishustin on 10.08.18.
//  Copyright © 2018 BorgmanLab. All rights reserved.
//

import UIKit

typealias EmptyBlock = () -> ()

class MainChatField: UIView {
    
    //MARK: - Outlets
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var tableView: TableViewChat!
    
    
    //MARK: - Properties
    
    let dataSourceChat = DataSourceChat(dateFormatterStyleString: "HH:mm")
    var hideKeyboardBlock: EmptyBlock?
    var tableViewOffset: CGPoint {
        return tableView.contentOffset
    }
    
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
        let gesterTap = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        contentView.addGestureRecognizer(gesterTap)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.alwaysBounceVertical = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.keyboardDismissMode = .onDrag
    }
    
    
    
    //MARK: - Public
    func changeOffset (_ offset: CGPoint, withAnimation animated: Bool) {
        tableView.setContentOffset(offset, animated: animated)
    }
    
    func hideKeyboard (_ hideKeyboardBlock: @escaping EmptyBlock) {
        self.hideKeyboardBlock = hideKeyboardBlock
    }
    
    func updateMessages(_ messages: [Message]) {
        for message in messages {
            dataSourceChat.addMessage(message)
            tableView.reloadData()
        }
    }
    
    func insertMessage (_ message: Message) {
        let tupleForUpdate = dataSourceChat.addMessage(message)
        tableView.beginUpdates()
        if tupleForUpdate.needUpdateSection {
            tableView.insertSections(dataSourceChat.indexSet, with: .bottom)
        } else {
            
            
            
            
            tableView.insertRows(at: [tupleForUpdate.indexPath], with: .bottom)
        }
        tableView.endUpdates()
        if dataSourceChat.count > 0 {
            tableView.scrollToRow(at: tupleForUpdate.indexPath, at: .bottom, animated: true)
        }
    }
    
    func scrollTableViewInBotton() {
        if dataSourceChat.count > 0 {
            tableView.scrollToRow(at: dataSourceChat.lastMessage, at: .bottom, animated: false)
        }
    }
    
    //MARK: - Actions and Changes
    @objc func hideKeyBoard() {
        guard let hideKeyboardBlock = hideKeyboardBlock else { return }
        hideKeyboardBlock()
    }
    
}



extension MainChatField: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSourceChat.sectionsCount
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceChat.rowsCountInSection(section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TempViewCell", for: indexPath) as! TempViewCell
        let message = dataSourceChat.getMessageAtIndexParh(indexPath)
        cell.setMessage(message)
        return cell
    }
}

extension MainChatField: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CastomHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        headerView.stringDate = dataSourceChat.titleStringInSection(section)
        headerView.cornerFooter()
        return headerView
    }
}




