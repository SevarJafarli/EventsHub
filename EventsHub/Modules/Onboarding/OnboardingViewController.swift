//
//  OnboardingViewController.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 16.06.24.
//

import UIKit
import SnapKit

final class OnboardingViewController: UIViewController {
    let viewModel = OnboardingViewModel()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 400)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        cv.backgroundColor = .blue
        return cv
    }()
    
    private let bottomButton: PrimaryButton = {
        let btn = PrimaryButton()
        btn.configure(.init(title: "Next", backgroundColor:.appPrimary))
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .appBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        addSubviews()
        configureConstraints()
    }
    
    //MARK: - Private
    
    private func addSubviews() {
        [collectionView, bottomButton].forEach(self.view.addSubview)
    }
    
    private func configureConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
        
        bottomButton.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
    }
}


extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        let item = self.viewModel.items[indexPath.row]
        cell.configure(item)
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegate {
    
}
