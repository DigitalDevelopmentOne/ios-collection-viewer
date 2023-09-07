/*
 
 Project: CollectionViewer
 File: UICollectionViewFlowLayout+EquatableToCollectionStyle.swift
 Created by: Egor Boyko
 Date: 08.09.2023
 
 Status: #In progress | #Not required
 
 */

import UIKit

extension UICollectionViewFlowLayout {
    static func == (lhs: UICollectionViewFlowLayout, rhs: CollectionStyle) -> Bool {
        lhs.minimumLineSpacing == rhs.minimumLineSpacing &&
        lhs.minimumInteritemSpacing == rhs.minimumInteritemSpacing &&
        lhs.itemSize == (rhs.itemSize ?? .init(width: 1, height: 1)) &&
        lhs.scrollDirection == rhs.scrollDirection
    }
}
