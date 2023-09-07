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
        
        if context.coordinator.inputData.count == context.coordinator.dataSource?.data.count {
            context.coordinator.inputData = self.views
            context.coordinator.dataSource?.updateData(newData: self.views)
            context.coordinator.dataSource?.update(uiCollection)
        } else {
            context.coordinator.inputData = self.views
            context.coordinator.dataSource?.updateData(newData: self.views)
        }
        
        if coordinator.collectionLayout == self.style { return }
#if DEBUG //----------------------------------------------------------------------------------------
        self.debugMessage(#function, "Changes")
#endif //-------------------------------------------------------------------------------------------

        let layout: UICollectionViewFlowLayout = .from(self.style)

        DispatchQueue.main.async {
            if layout.itemSize == coordinator.collectionLayout?.itemSize {
                uiCollection.setCollectionViewLayout(layout, animated: true)
                coordinator.collectionLayout = layout
                return
            } else {
                uiCollection.setCollectionViewLayout(layout, animated: true)
                coordinator.collectionLayout = layout
                let visibleItems = uiCollection.indexPathsForVisibleItems
                uiCollection.performBatchUpdates {
                    uiCollection.reloadItems(at: visibleItems)
                }
            }
        }
        
    }
}
