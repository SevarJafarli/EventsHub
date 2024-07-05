//
//  ProfileViewController.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 23.06.24.
//

import UIKit

class ProfileViewController: UIViewController {

    private let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.backgroundColor = .clear
        tv.showsVerticalScrollIndicator = false
        tv.separatorStyle = .none
        tv.allowsSelection = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Profile"
//        tableView.dataSource = self
//        tableView.delegate = self
        addSubviews()
        configureConstraints()
    }
    
    //MARK: - Private
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func configureConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//
//extension ProfileViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}
//
//extension ProfileViewController: UITableViewDelegate {
//    
//}
