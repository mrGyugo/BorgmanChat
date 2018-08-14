//
//  InputTextView.swift
//  TestChatLibrary
//
//  Created by Mac_Work on 14.08.2018.
//  Copyright © 2018 BorgmanLab. All rights reserved.
//

import UIKit
import NextGrowingTextView

typealias MessageBlock = (_ messge: Message) -> ()
typealias GrowTextBlock = (_ height: CGFloat) -> ()

class InputTextView: UIView {
    
    //Propertes
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var growingTextView: NextGrowingTextView! {
        didSet {
            growingTextView.layer.cornerRadius = 4
            growingTextView.showsHorizontalScrollIndicator = false
            growingTextView.showsVerticalScrollIndicator = false
            growingTextView.textView.textContainerInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
            growingTextView.clipsToBounds = true
            growingTextView.delegates.willChangeHeight = { [weak self] height in
                guard let this = self else { return }
                guard let growBlock = this.growTextBlock else { return }
                growBlock(height)
            }
        }
    }
    private var messageText: String {
        return growingTextView.textView.text
    }

    //ActionBlocks
    private var sendMessageBlock: MessageBlock?
    private var growTextBlock: GrowTextBlock?
    
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
        Bundle.main.loadNibNamed("InputTextView", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    
    //MARK: - Publick
    func addMessage (messageBlock: @escaping MessageBlock) {
        sendMessageBlock = messageBlock
    }
    
    func changeHeightText(growingTextBlock: @escaping GrowTextBlock) {
        growTextBlock = growingTextBlock
    }
    
    //MARK: Actions
    @IBAction private func sendMessageAction(_ sender: UIButton) {
        guard messageText.count > 0 else { return }
        guard let sendMessage = sendMessageBlock else { return }
        sendMessage(Message(message: messageText, createDate: Date()))
        growingTextView.textView.text = ""
    }
    
}

