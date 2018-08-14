//
//  TempViewCell.swift
//  TestChatLibrary
//
//  Created by Mac_Work on 14.08.2018.
//  Copyright © 2018 BorgmanLab. All rights reserved.
//

import UIKit

class TempViewCell: UITableViewCell {

    @IBOutlet private weak var messageTextLabel: UILabel!
    private var message: Message? = nil {
        didSet {
            guard let message = message else { return }
            messageTextLabel.text = message.message
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageTextLabel.text = nil
        message = nil
    }
    
    override func prepareForReuse() {
        messageTextLabel.text = nil
        message = nil
    }
    
    
    //MARK: - Public
    func setMessage(_ message: Message) {
        self.message = message
    }
    
}
