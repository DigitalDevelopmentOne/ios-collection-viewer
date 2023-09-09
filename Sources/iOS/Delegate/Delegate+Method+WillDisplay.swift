/*
 
 Project: CollectionViewer
 File: Delegate+Method+WillDisplay.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

extension Delegate{
    @inlinable
    func willDisplay(
        _ collectionView: UICollectionView,
        _ cell: UICollectionViewCell,
        _ indexPath: IndexPath
    ){
        if let count = self.coordinator?.dataSource?.data.count, indexPath.item > count - 20 {
            self.coordinator?.dataSource?.loadingFromBuffer(collectionView)
        }
    }
}
