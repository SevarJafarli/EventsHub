//
//  HomeHeaderViewCell.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 17.06.24.
//

import UIKit

final class HomeHeaderViewCell: UITableViewCell {
    
    //MARK: - Views
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .equalSpacing
        sv.spacing = 8
        return sv
    }()
    
    private let welcomeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Welcome, Sevar!"
        lbl.font = .systemFont(ofSize: 20, weight: .semibold)
        return lbl
    }()
    
    private let profileImageView: UIImageView = {
        let imgView = UIImageView(image: .me)
        imgView.contentMode = .scaleAspectFill
        imgView.roundCorners(.allCorners, radius: 24)
        return imgView
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Private
    
    private func addSubviews() {
        [welcomeLabel, profileImageView].forEach(stackView.addArrangedSubview)
        contentView.addSubview(stackView)
    }
    
    private func configureConstraints() {
        stackView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(4)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.size.equalTo(48)
        }
    }
}
