//
//  OnboardingCollectionViewCell.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 16.06.24.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    //MARK: - Views
    
    private let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = .red
        return imgView
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.textColor = .appPrimary
        lbl.font = .systemFont(ofSize: 24, weight: .semibold)
        return lbl
    }()
    
    private let subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
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
        [imageView, titleLabel, subtitleLabel].forEach(contentView.addSubview)
    }
    
    private func configureConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}


extension OnboardingCollectionViewCell {
    struct Item {
        let imagePath: String
        let title: String
        let subtitle: String
    }
    
    public func configure(_ item: Item) {
        self.imageView.image = UIImage(named: item.imagePath)
        self.titleLabel.text = item.title
        self.subtitleLabel.text = item.subtitle
    }
}
