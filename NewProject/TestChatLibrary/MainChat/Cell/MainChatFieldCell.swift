//
//  MainChatFieldCell.swift
//  TestChatLibrary
//
//  Created by Viktor Mishustin on 10.08.18.
//  Copyright © 2018 BorgmanLab. All rights reserved.
//

import UIKit

class MainChatFieldCell: UITableViewCell {
    
    @IBOutlet private weak var messageTextLabel: UILabel!
    private var message: MessageProtocol? = nil {
        didSet {
            guard let message = message else { return }
            messageTextLabel.text = message.message
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        messageTextLabel = nil
        message = nil
    }
    
    
    //MARK: - Public
    func setMessage(_ message: MessageProtocol) {
        self.message = message
    }

}
