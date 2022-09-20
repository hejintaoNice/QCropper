//
//  TopBar.swift
//
//  Created by Chen Qizhi on 2019/10/15.
//

import UIKit

class TopBar: UIView {
    lazy var flipButton: UIButton = {
        let button = self.iconButton(iconName: "2IconBack")
        button.left = 10
        button.autoresizingMask = [.flexibleTopMargin, .flexibleRightMargin]
        return button
    }()

    lazy var rotateButton: UIButton = {
        let button = self.iconButton(iconName: "QCropper.rotate.right.fill")
        button.right = self.width - 10
        button.autoresizingMask = [.flexibleTopMargin, .flexibleRightMargin]
        return button
    }()

    lazy var aspectRationButton: UILabel = {
        let button = UILabel()
        button.font = UIFont(name: "PingFangSC-Semibold", size: 16)
        button.textColor = .white
        button.text = "修改头像"
        button.textAlignment = .center
        button.bottom = height
        button.right = (self.width - 100) / 2.0
        button.size = CGSize(width: 100, height: 44)
        return button
    }()

    lazy var blurBackgroundView: UIVisualEffectView = {
        let vev = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        vev.alpha = 0.3
        vev.backgroundColor = .clear
        vev.frame = self.bounds
        vev.isUserInteractionEnabled = false
        vev.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin, .flexibleHeight, .flexibleWidth]
        return vev
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(blurBackgroundView)
        addSubview(aspectRationButton)
        addSubview(flipButton)
        addSubview(rotateButton)
        
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func iconButton(iconName: String) -> UIButton {
        let button = IconButton(iconName)
        button.bottom = height
        return button
    }
}

class IconButton: UIButton {
    init(_ iconName: String) {
        super.init(frame: CGRect(center: .zero, size: CGSize(width: 44, height: 44)))

        let image = UIImage(named: iconName, in: QCropper.Config.resourceBundle, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        setImage(image, for: .normal)
        tintColor = UIColor(white: 1, alpha: 1)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                tintColor = QCropper.Config.highlightColor
            } else {
                tintColor = UIColor(white: 1, alpha: 1)
            }
        }
    }
}

