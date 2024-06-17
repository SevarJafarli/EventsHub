//
//  EventCategoryView.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 17.06.24.
//

import UIKit

class EventCategoryView: UIView {
    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12, weight: .medium)
        return lbl
    }()
    
    //MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.roundCorners(.allCorners, radius: 4)
        addSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Private
    
    private func addSubviews() {
        addSubview(nameLabel)
    }
    
    private func configureConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(2)
            make.horizontalEdges.equalToSuperview().inset(4)
        }
    }
    
    //MARK: - Public
    
    public func configure(_ name: String) {
        nameLabel.text = name
    }
}
