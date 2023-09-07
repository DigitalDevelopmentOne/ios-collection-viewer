/*
 
 Project: CollectionViewer
 File: CollectionViewRepresentable+Method+UpdateCoordinator.swift
 Created by: Egor Boyko
 Date: 07.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

extension CollectionViewRepresentable {
    @inlinable
    func updateCoordinator(_ uiCollection: UICollectionView, context: Context) {
        if !context.coordinator.isConfigured { return }
        let coordinator = context.coordinator
        if context.coordinator.inputData.count != self.views.count {
            if context.coordinator.inputData.count == context.coordinator.dataSource?.data.count {
                context.coordinator.inputData = self.views
                context.coordinator.dataSource?.update(uiCollection)
            } else {
                context.coordinator.inputData = self.views
            }
        }
        if coordinator.collectionLayout?.scrollDirection != self.scrollDirection {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = self.scrollDirection
            layout.itemSize = .init(width: 100, height: 100)
            layout.minimumLineSpacing = 2
            layout.minimumInteritemSpacing = 2
            DispatchQueue.main.async {
                uiCollection.setCollectionViewLayout(layout, animated: true)
            }
        }
    }
}
