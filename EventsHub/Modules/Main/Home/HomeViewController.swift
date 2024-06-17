//
//  HomeViewController.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 16.06.24.
//

import UIKit

final class HomeViewController: UIViewController {
    private let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.allowsSelection = false
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeHeaderViewCell.self, forCellReuseIdentifier: HomeHeaderViewCell.identifier)
        tableView.register(EventsViewCell.self, forCellReuseIdentifier: EventsViewCell.identifier)
        tableView.register(CategoriesViewCell.self, forCellReuseIdentifier: CategoriesViewCell.identifier)
        tableView.register(HomeSearchViewCell.self, forCellReuseIdentifier: HomeSearchViewCell.identifier)
        
        addSubviews()
        configureConstraints()
    }
    
    private func addSubviews() {
        self.view.addSubview(tableView)
    }
    
    private func configureConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        HomeViewSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = HomeViewSections.allCases[indexPath.section]
        
        switch section {
        case .welcomeHeader:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeHeaderViewCell.identifier, for: indexPath) as! HomeHeaderViewCell
            return cell
        
        case .search:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeSearchViewCell.identifier, for: indexPath) as! HomeSearchViewCell
            return cell
            
        case .featuredEvents:
            let cell = tableView.dequeueReusableCell(withIdentifier: EventsViewCell.identifier, for: indexPath) as! EventsViewCell
            
            cell.delegate = self
            return cell
        
        case .categories:
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesViewCell.identifier, for: indexPath) as! CategoriesViewCell
            return cell
            
        case .upcomingEvents:
            let cell = tableView.dequeueReusableCell(withIdentifier: EventsViewCell.identifier, for: indexPath) as! EventsViewCell
            cell.delegate = self
            return cell
            
        case .suggestions:
            let cell = tableView.dequeueReusableCell(withIdentifier: EventsViewCell.identifier, for: indexPath) as! EventsViewCell
            cell.delegate = self

            return cell

        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = HomeViewSections.allCases[section]
        if let sectionTitle = section.sectionTitle {
            return HomeSectionHeader(header: sectionTitle)
        }
        return nil
    }
}


extension HomeViewController: UITableViewDelegate {
}


extension HomeViewController: UICollectionViewDelegate {
    
}

//MARK: - EventsViewCellDelegate

extension HomeViewController: EventsViewCellDelegate {
    func onEventSelected(at index: Int) {
        let vc = EventInfoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
