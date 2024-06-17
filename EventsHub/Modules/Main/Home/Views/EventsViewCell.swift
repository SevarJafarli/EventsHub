//
//  EventsViewCell.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 17.06.24.
//

import UIKit

protocol EventsViewCellDelegate: AnyObject {
    func onEventSelected(at index: Int) //TODO: change to model
}

final class EventsViewCell: UITableViewCell {
    
    weak var delegate: EventsViewCellDelegate?
    
    //MARK: - Views
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: (UIScreen.main.bounds.width - 16) / 2, height: 180)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        cv.backgroundColor = .systemBackground
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(EventViewCell.self, forCellWithReuseIdentifier: EventViewCell.identifier)
        
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
            make.height.equalTo(180)
        }
    }
}


extension EventsViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventViewCell.identifier, for: indexPath) as! EventViewCell
        return cell
    }
}

extension EventsViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.onEventSelected(at: indexPath.row)
    }
}
