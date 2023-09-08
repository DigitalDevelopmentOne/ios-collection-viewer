/*
 
 Project: CollectionViewer
 File: Style.swift
 Created by: Egor Boyko
 Date: 08.09.2023
 
 Status: #In progress | #Not required
 
 */

import UIKit

public extension Configuration {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.minimumLineSpacing == rhs.minimumLineSpacing &&
        lhs.minimumInteritemSpacing == rhs.minimumInteritemSpacing &&
        lhs.itemSize == rhs.itemSize &&
        lhs.scrollDirection == rhs.scrollDirection
    }
    
    var unwrappItemSize: CGSize {
        self.itemSize ?? .init(width: 1, height: 1)
    }
}
