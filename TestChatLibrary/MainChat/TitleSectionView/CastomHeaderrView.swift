//
//  CostomFooterView.swift
//  Odigo.Chat
//
//  Created by Mac_Work on 24.01.18.
//  Copyright © 2018 Mac_Work. All rights reserved.
//

import UIKit


class CastomHeaderView: UITableViewHeaderFooterView {
    
    
    @IBOutlet private var mainView: UIView!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var backroundView: UIView!

    var stringDate: String {
        set {
            dateLabel.text = newValue
        }
        get {
            return dateLabel.text!
        }
    }
    
    func cornerFooter() {
        backroundView.layer.cornerRadius = 10
        backroundView.layer.masksToBounds = true
    }

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
  
  
    private func commonInit() {
        Bundle.main.loadNibNamed("CastomHeaderView", owner: self, options: nil)
        addSubview(mainView)
        backgroundView = UIView()
        backgroundView!.backgroundColor = .clear
        mainView.frame = self.bounds
        mainView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
