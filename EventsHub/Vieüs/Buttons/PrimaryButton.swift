//
//  PrimaryButton.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 16.06.24.
//

import UIKit

class PrimaryButton: UIButton {
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension PrimaryButton {
    struct Model {
        let title: String
        let titleColor: UIColor
        let cornerRadius: CGFloat
        let backgroundColor: UIColor
        let hasBorder: Bool
        let borderColor: UIColor
        let borderWidth: CGFloat
        
        init(title: String, titleColor: UIColor = UIColor.white, cornerRadius: CGFloat = 12, backgroundColor: UIColor, hasBorder: Bool = false, borderColor: UIColor = .lightGray, borderWidth: CGFloat = 1) {
            self.title = title
            self.titleColor = titleColor
            self.cornerRadius = cornerRadius
            self.backgroundColor = backgroundColor
            self.hasBorder = hasBorder
            self.borderColor = borderColor
            self.borderWidth = borderWidth
        }
    }
    
    public func configure(_ model: Model) {
        self.setTitle(model.title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        self.setTitleColor(model.titleColor, for: .normal)
        self.layer.cornerRadius = model.cornerRadius
        self.backgroundColor = model.backgroundColor
        
        if model.hasBorder {
            self.layer.borderWidth = model.borderWidth
            self.layer.borderColor = model.borderColor.cgColor
        }
        
        self.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
    }
}

