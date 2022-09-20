//
//  Toolbar.swift
//
//  Created by Chen Qizhi on 2019/10/15.
//

import UIKit

class Toolbar: UIView {
    lazy var cancelButton: UIButton = {
        let button = self.titleButton("Cancel")
        button.left = 0
        button.autoresizingMask = [.flexibleBottomMargin, .flexibleRightMargin]
        return button
    }()

    lazy var resetButton: UIButton = {
        let button = self.titleButton("RESET", highlight: true)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.isHidden = true
        button.centerX = self.width / 2
        button.autoresizingMask = [.flexibleBottomMargin, .flexibleRightMargin]
        return button
    }()

    lazy var doneButton: UIButton = {
        let button = self.titleButton("确定", highlight: true)
        button.setTitleColor(UIColor(white: 1, alpha: 1), for: .disabled)
        button.autoresizingMask = [.flexibleBottomMargin, .flexibleLeftMargin]
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.init(red: 18/255.0, green: 18/255.0, blue: 18/255.0, alpha: 1)
        return button
    }()

    lazy var blurBackgroundView: UIView = {
        let vev = UIView()
        vev.backgroundColor = UIColor.init(red: 18/255.0, green: 18/255.0, blue: 18/255.0, alpha: 1)
        vev.frame = self.bounds
        vev.isUserInteractionEnabled = false
        vev.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin, .flexibleHeight, .flexibleWidth]
        return vev
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(doneButton)
        
        self.doneButton.frame = CGRect(x: 20, y: 0, width: self.width - 40, height: 50)
        
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func titleButton(_ title: String, highlight: Bool = false) -> UIButton {
        let font = UIFont.systemFont(ofSize: 16, weight: .medium)
        let button = UIButton.init()
        button.setTitleColor(UIColor(white: 1, alpha: 1.0), for: .normal)
        
        button.titleLabel?.font = font
        button.setTitle(title, for: .normal)
        button.top = 0

        button.autoresizingMask = [.flexibleRightMargin, .flexibleWidth]
        return button
    }
}

