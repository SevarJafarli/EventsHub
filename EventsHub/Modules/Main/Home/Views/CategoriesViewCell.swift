//
//  CategoriesViewCell.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 17.06.24.
//

import UIKit

class CategoriesViewCell: UITableViewCell {
    
    //MARK: - Views
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.itemSize = .init(width: 64, height: 82)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.contentInset = .init(top: 8, left: 16, bottom: 8, right: 16)
        cv.backgroundColor = .systemBackground
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryViewCell.self, forCellWithReuseIdentifier: CategoryViewCell.identifier)
        
        addSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Private
    
    private func addSubviews() {
        contentView.addSubview(collectionView)
    }
    
    private func configureConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(82 + 16)
        }
    }
}


extension CategoriesViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryViewCell.identifier, for: indexPath) as! CategoryViewCell
        return cell
    }
}

extension CategoriesViewCell: UICollectionViewDelegate {
    
}
