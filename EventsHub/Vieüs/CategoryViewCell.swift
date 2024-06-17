//
//  CategoryViewCell.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 17.06.24.
//

import UIKit

class CategoryViewCell: UICollectionViewCell {
    
    //MARK: - Views
    
    private let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appPrimary.withAlphaComponent(0.8)
        view.roundCorners(.allCorners, radius: 8)
        return view
    }()
    
    private let categoryImageView: UIImageView = {
        let imgView = UIImageView(image: .chef)
        imgView.tintColor = .white
        return imgView
    }()
    
    private let categoryNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.text = "Cooking"
        lbl.font = .systemFont(ofSize: 12, weight: .medium)
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
        bgView.addSubview(categoryImageView)
        [bgView, categoryNameLabel].forEach(contentView.addSubview)
    }
    
    private func configureConstraints() {
        categoryImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(24)
        }
        
        bgView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(52)
        }
        
        categoryNameLabel.snp.makeConstraints { make in
            make.top.equalTo(bgView.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(2)
            make.bottom.equalToSuperview()
        }
    }
}
