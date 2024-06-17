//
//  HomeSectionHeader.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 17.06.24.
//

import UIKit

class HomeSectionHeader: UIView {
    private let headerLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 20, weight: .semibold)
        return lbl
    }()
    
    //MARK: - Init
    
    init(header: String) {
        super.init(frame: .zero)
        headerLabel.text = header
        addSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Private
    
    private func addSubviews() {
        addSubview(headerLabel)
    }
    
    private func configureConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(8)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
}
