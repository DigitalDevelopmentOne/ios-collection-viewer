/*
 
 Project: CollectionViewer
 File: Optional+UICollectionViewFlowLayout+EquatableToCollectionStyle.swift
 Created by: Egor Boyko
 Date: 08.09.2023
 
 Status: #In progress | #Not required
 
 */

import UIKit

extension Optional where Wrapped == UICollectionViewFlowLayout {
    static func == (lhs: Self, rhs: CollectionConfiguration) -> Bool {
        switch lhs {
        case .none:
            return false
        case .some(let wrapped):
            return wrapped.minimumLineSpacing == rhs.minimumLineSpacing &&
            wrapped.minimumInteritemSpacing == rhs.minimumInteritemSpacing &&
            wrapped.itemSize == rhs.unwrappItemSize &&
            wrapped.scrollDirection == rhs.scrollDirection
        }
    }
}
