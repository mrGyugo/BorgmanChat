//
//  TempViewCell.swift
//  TestChatLibrary
//
//  Created by Mac_Work on 14.08.2018.
//  Copyright © 2018 BorgmanLab. All rights reserved.
//

import UIKit

class TempViewCell: UITableViewCell {
    
    
    @IBOutlet weak var foneView: UIView!
    

    @IBOutlet private weak var messageTextLabel: UILabel!
    @IBOutlet private weak var messageDateLabel: UILabel!
    @IBOutlet private weak var imageViewBubble: UIImageView!
    
    
    private var message: Message? = nil {
        didSet {
            guard let message = message else { return }
            messageTextLabel.text = message.message
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewBubble.image = UIImage(named: "BubbleRight")!.resizableImage(withCapInsets: UIEdgeInsetsMake(22, 26, 22, 26)).withRenderingMode(.alwaysTemplate)
        imageViewBubble.tintColor = #colorLiteral(red: 0.7803921569, green: 0.8274509804, blue: 0.8666666667, alpha: 1)
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
