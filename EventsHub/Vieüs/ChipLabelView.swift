//
//  ChipLabelView.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 22.06.24.
//

import UIKit

class ChipLabelView: UIView {
    
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14, weight: .regular)
        lbl.textAlignment = .center
        return lbl
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Private
    
    private func addSubviews() {
        addSubview(label)
    }
    
    private func configureConstraints() {
        label.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(6)
            make.horizontalEdges.equalToSuperview().inset(8)
        }
    }
}


extension ChipLabelView {
    struct Item {
        let text: String
        let textColor: UIColor
        let backgroundColor: UIColor
        let cornerRadius: CGFloat
        
        init(text: String, textColor: UIColor = .appPrimary, backgroundColor: UIColor = .lilac, cornerRadius: CGFloat = 0) {
            self.text = text
            self.textColor = textColor
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
        }
    }
    
    public func configure(_ item: Item) {
        self.label.text = item.text
        self.label.textColor = item.textColor
        self.backgroundColor = item.backgroundColor
        self.roundCorners(.allCorners, radius: item.cornerRadius)
    }
}
