/*
 
 Project: CollectionViewer
 File: CollectionConfiguration.swift
 Created by: Egor Boyko
 Date: 08.09.2023
 
 Status: #In progress | #Not required
 
 */

import UIKit

struct CollectionConfiguration: Configuration {
    init(){}
    
    var gridColumns: CGFloat? = nil
    var minimumLineSpacing: CGFloat = 1
    var minimumInteritemSpacing: CGFloat = 1
    var itemSize: CGSize? = nil
    var scrollDirection: UICollectionView.ScrollDirection = .vertical
    var sizeCaching: Bool = true
    var refresAction: RefresActionStorage? = nil

    init<T: Configuration>(from configuration: T) {
        self.gridColumns = configuration.gridColumns
        self.minimumLineSpacing = configuration.minimumLineSpacing
        self.minimumInteritemSpacing = configuration.minimumInteritemSpacing
        self.itemSize = configuration.itemSize
        self.scrollDirection = configuration.scrollDirection
        self.sizeCaching = configuration.sizeCaching
        self.refresAction = configuration.refresAction
    }
}
