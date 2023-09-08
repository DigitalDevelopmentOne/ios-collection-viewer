/*
 
 Project: CollectionViewer
 File: CollectionConfiguration.swift
 Created by: Egor Boyko
 Date: 08.09.2023
 
 Status: #In progress | #Not required
 
 */

import UIKit

struct CollectionConfiguration: Configuration {
    var gridColumns: CGFloat? = nil
    var minimumLineSpacing: CGFloat = 1
    var minimumInteritemSpacing: CGFloat = 1
    var itemSize: CGSize? = nil
    var scrollDirection: UICollectionView.ScrollDirection = .vertical
}
