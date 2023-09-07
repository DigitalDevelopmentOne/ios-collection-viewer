/*
 
 Project: CollectionViewer
 File: UICollectionViewFlowLayout+Method+From.swift
 Created by: Egor Boyko
 Date: 08.09.2023
 
 Status: #In progress | #Not required
 
 */

import UIKit

extension UICollectionViewFlowLayout {
    static func from(_ style: CollectionStyle) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = style.scrollDirection
        layout.itemSize = style.unwrappItemSize
        layout.minimumLineSpacing = style.minimumLineSpacing
        layout.minimumInteritemSpacing = style.minimumInteritemSpacing
        return layout
    }
}
