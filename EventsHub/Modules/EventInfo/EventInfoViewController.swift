//
//  EventInfoViewController.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 17.06.24.
//


import UIKit

class EventInfoViewController: UIViewController {
    
    let headerHeight: CGFloat = 200.0
    let contentHeight: CGFloat = UIScreen.main.bounds.height
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.showsVerticalScrollIndicator = false
        sv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        sv.contentSize = CGSize(width: view.bounds.width, height: contentHeight + headerHeight)
        sv.delegate = self
        return sv
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: headerHeight, width: UIScreen.main.bounds.width, height: contentHeight)
        return view
    }()
    
    private lazy var headerView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.cooking // Replace with your image
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: headerHeight)
        return view
    }()
    
    private let contentStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 16
        return sv
    }()
    
    private let eventTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Cooking Masterclass with Chef Emma"
        lbl.font = .systemFont(ofSize: 20, weight: .semibold)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let eventholderHStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 8
        sv.alignment = .leading
        return sv
    }()
    
    private let eventholderIcon: UIImageView = {
        let icon = UIImageView(image: .organizator)
        icon.tintColor = .navy
        return icon
    }()
    
    private let eventholderNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
        lbl.text = "Cooking Studio"
        return lbl
    }()
    
    private let eventCategoryView: ChipLabelView = {
        let view = ChipLabelView()
        view.configure(.init(text: "Cooking", cornerRadius: 6))
        return view
    }()
    
    private let eventDetailStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 16
        return sv
    }()
    
    private let eventDateView: LeftCircleIconTitleSubtitleView = {
        let view = LeftCircleIconTitleSubtitleView()
        view.configure(.init(icon: UIImage(systemName: "calendar"), title: "Saturday, June 24 2024", subtitle: "09:00 AM - 11: AM"))
        return view
    }()
    
    private let eventLocationView: LeftCircleIconTitleSubtitleView = {
        let view = LeftCircleIconTitleSubtitleView()
        view.configure(.init(icon: UIImage(systemName: "location"), title: "Arah House", subtitle: "R.Akhundov 40/6"))
        return view
    }()
    
    private let eventDescriptionHeaderLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Description"
        lbl.font = .systemFont(ofSize: 18, weight: .semibold)
        return lbl
    }()
    
    private let eventDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ac massa dignissim, lobortis augue ut, faucibus tellus. Integer maximus neque vitae diam maximus, eu faucibus sapien semper. Aliquam porttitor orci dui, gravida euismod est suscipit eu. Nullam ut orci nulla. Nulla facilisi. Quisque ut placerat leo. Nulla mi justo, feugiat vel diam at, interdum mollis velit.

Praesent ac ante sed dui blandit scelerisque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla et interdum lacus. Donec aliquam luctus est sit amet mattis. Vivamus hendrerit, mauris quis luctus facilisis, ante dui pharetra urna, eget venenatis tortor nulla quis erat. Maecenas vel sodales ipsum. Aliquam erat volutpat.
"""
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
        lbl.textColor = .darkGray
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private var isNavigationBarHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackButton()
        view.backgroundColor = .systemBackground
        setupContentView()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    
    private func setupHeaderView() {
        headerView.image = UIImage.cooking // Replace with your image
        headerView.contentMode = .scaleAspectFill
        headerView.clipsToBounds = true
        headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: headerHeight)
        scrollView.addSubview(headerView)
    }
    
    private func setupContentView() {
        
        [eventholderIcon, eventholderNameLabel, UIView()].forEach(eventholderHStackView.addArrangedSubview)
        
        [eventDateView, eventLocationView].forEach(eventDetailStackView.addArrangedSubview)
        
        let sv = UIStackView(arrangedSubviews: [eventCategoryView, UIView()])
        sv.axis = .horizontal
        
        [eventTitleLabel, sv, eventholderHStackView, eventDetailStackView, eventDescriptionHeaderLabel, eventDescriptionLabel, UIView()].forEach(contentStackView.addArrangedSubview)
        scrollView.addSubview(headerView)
        contentView.addSubview(contentStackView)
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
        eventholderIcon.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
        
    }
}


//MARK: - UIScrollViewDelegate

extension EventInfoViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        
        if yOffset < 0 {
            // Expand the header view
            headerView.frame = CGRect(x: 0, y: yOffset, width: view.bounds.width, height: headerHeight - yOffset)
        } else {
            // Move the header view up with the scroll
            headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: headerHeight)
        }
        
        // Adjust the opacity of the header view
        let alpha = 1.0 - (yOffset / headerHeight)
        headerView.alpha = max(alpha, 0)
        
        // Smoothly show/hide the navigation bar based on the scroll position
        if yOffset > headerHeight - 60 {
            if isNavigationBarHidden {
                isNavigationBarHidden = false
                UIView.animate(withDuration: 0.3) {
                    self.navigationController?.setNavigationBarHidden(false, animated: true)
                    self.title = "Cooking Masterclass with Chef Emma"
                }
            }
        } else {
            if !isNavigationBarHidden {
                isNavigationBarHidden = true
                UIView.animate(withDuration: 0.3) {
                    self.navigationController?.setNavigationBarHidden(true, animated: true)
                    self.title = nil
                }
            }
        }
    }
}
