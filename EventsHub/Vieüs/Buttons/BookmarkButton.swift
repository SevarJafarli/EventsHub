//
//  BookmarkButton.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 17.06.24.
//

import UIKit

class BookmarkButton: UIButton {
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(systemName: "bookmark"), for: .normal)
        self.setImage(UIImage(systemName: "bookmark.fill"), for: .selected)
        self.tintColor = .lightGray
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
