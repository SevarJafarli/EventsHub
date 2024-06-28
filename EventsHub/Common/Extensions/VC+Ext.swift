//
//  VC+Ext.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 22.06.24.
//

import UIKit

extension UIViewController {
    func setBackButton() {
        self.navigationItem.hidesBackButton = true
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .label
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Create a bar button item using the custom button
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
    
    }
    
    @objc private func backButtonTapped() {
           // Handle back button tap
           self.navigationController?.popViewController(animated: true)
    }
}
