//
//  LeftCircleIconTitleSubtitleView.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 23.06.24.
//

import UIKit

class LeftCircleIconTitleSubtitleView: UIView {

    //MARK: - Init
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 12
        return sv
    }()
    
    private let rightStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 2
        return sv
    }()
    
    private let circleIconBgView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.roundCorners(.allCorners, radius: 24)
        return view
    }()
    
    private let iconView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .gray
        return view
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16, weight: .medium)
        return lbl
    }()
    
    private let subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14, weight: .regular)
        lbl.textColor = .gray
        return lbl
    }()
    
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
        circleIconBgView.addSubview(iconView)
        [titleLabel, subtitleLabel].forEach(rightStackView.addArrangedSubview)
        [circleIconBgView, rightStackView].forEach(stackView.addArrangedSubview)
        addSubview(stackView)
    }
    
    private func configureConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(48)
        }
        
        iconView.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.center.equalToSuperview()
        }
        
        circleIconBgView.snp.makeConstraints { make in
            make.size.equalTo(48)
        }
    }
}

extension LeftCircleIconTitleSubtitleView {
    struct Item {
        let icon: UIImage?
        let title: String
        let subtitle: String
    }
    
    public func configure(_ item: Item) {
        self.iconView.image = item.icon
        self.titleLabel.text = item.title
        self.subtitleLabel.text = item.subtitle
        
    }
}

