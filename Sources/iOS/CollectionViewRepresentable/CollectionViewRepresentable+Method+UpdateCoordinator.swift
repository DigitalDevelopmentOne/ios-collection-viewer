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
    func updateCoordinator(_ uiCollection: AuxiliaryUICollectionView, context: Context) {
        if !context.coordinator.isConfigured {
#if DEBUG //----------------------------------------------------------------------------------------
        self.debugMessage(#function, "Not configured")
#endif //-------------------------------------------------------------------------------------------
            return
        }
        let coordinator = context.coordinator
        
        if context.coordinator.inputData.count == context.coordinator.dataSource?.data.count {
            context.coordinator.inputData = self.views
            context.coordinator.dataSource?.updateData(newData: self.views)
            context.coordinator.dataSource?.update(uiCollection)
        } else {
            context.coordinator.inputData = self.views
            context.coordinator.dataSource?.updateData(newData: self.views)
        }
        
        
        if let refresStorage = self.configuration.refresAction {
            let refresher = UIRefreshControl()
            refresher.addTarget(refresStorage, action: #selector(refresStorage.action), for: .valueChanged)
            uiCollection.alwaysBounceVertical = true
            uiCollection.addSubview(refresher)
        }
        
        
        if coordinator.collectionLayout == self.configuration { return }
#if DEBUG //----------------------------------------------------------------------------------------
        self.debugMessage(#function, "Changes")
#endif //-------------------------------------------------------------------------------------------

        let layout: UICollectionViewFlowLayout = .from(self.configuration)
        
        uiCollection.gridColumns = self.configuration.gridColumns
        uiCollection.sizeCaching = self.configuration.sizeCaching
        
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
