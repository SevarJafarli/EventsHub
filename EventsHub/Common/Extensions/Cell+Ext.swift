//
//  Cell+Ext.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 16.06.24.
//

import UIKit

protocol CellIdentifier {
    static var identifier: String { get }
}

extension CellIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: CellIdentifier { }

extension UITableViewCell: CellIdentifier { }


