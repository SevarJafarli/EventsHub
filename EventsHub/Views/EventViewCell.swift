//
//  EventViewCell.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 17.06.24.
//

import UIKit

final class EventViewCell: UICollectionViewCell {
    
    //MARK: - Views
    
    private let imageView: UIImageView = {
        let imgView = UIImageView(image: .cooking)
        imgView.isUserInteractionEnabled = true
        imgView.roundCorners(.allCorners, radius: 8)
        return imgView
    }()
    
    private let categoryTag: EventCategoryView = {
        let view = EventCategoryView()
        view.configure("Cooking")
        return view
    }()
    
    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Cooking Workshop at san fransico"
        lbl.font = .systemFont(ofSize: 14, weight: .medium)
        return lbl
    }()
    
    private let dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "June 20, 2024"
        lbl.font = .systemFont(ofSize: 12, weight: .regular)
        return lbl
    }()
    
    private lazy var bookmarkBtn: BookmarkButton = {
        let btn = BookmarkButton()
        btn.addTarget(self, action: #selector(onBookmarked(_:)), for: .touchUpInside)
        return btn
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
        [categoryTag, bookmarkBtn].forEach(imageView.addSubview)
        [imageView, nameLabel, dateLabel].forEach(contentView.addSubview)
    }
    
    private func configureConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(144)
        }
        
        categoryTag.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(6)
        }
        
        bookmarkBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.trailing.equalToSuperview().offset(-6)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(2)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(2)
            make.horizontalEdges.equalToSuperview().inset(2)
            make.bottom.equalToSuperview()
        }
    }
    
    //MARK: - Private
    
    @objc
    private func onBookmarked(_ sender: BookmarkButton) {
        sender.isSelected.toggle()
    }
    
}
