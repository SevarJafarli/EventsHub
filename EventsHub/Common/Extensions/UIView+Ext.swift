//
//  UIView+Ext.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 17.06.24.
//

import UIKit


public extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
    }
    
    func roundCorners() {
        roundCorners(.allCorners, radius: frame.height / 2)
    }
}
