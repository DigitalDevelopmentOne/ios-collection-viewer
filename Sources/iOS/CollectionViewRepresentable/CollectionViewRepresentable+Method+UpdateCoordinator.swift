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
            if self.views.isEmpty {
                context.coordinator.dataSource?.data = []
            } else {
                context.coordinator.dataSource?.updateData(newData: self.views)
            }
        }
        
        if let refresher = self.configuration.refresher,
           refresher.id != uiCollection.refreshID
        {
#if DEBUG //----------------------------------------------------------------------------------------
        self.debugMessage(#function, "Add Refresher")
#endif //-------------------------------------------------------------------------------------------
            refresher.refreshControl.addTarget(
                refresher,
                action: #selector(refresher.action),
                for: .valueChanged
            )
            uiCollection.refreshID = refresher.id
            uiCollection.alwaysBounceVertical = true
            uiCollection.addSubview(refresher.refreshControl)
        }
        
        uiCollection.gridColumns = self.configuration.gridColumns
        uiCollection.sizeCaching = self.configuration.sizeCaching
         
        if coordinator.collectionLayout == self.configuration { return }
#if DEBUG //----------------------------------------------------------------------------------------
        self.debugMessage(#function, "Changes")
#endif //-------------------------------------------------------------------------------------------

        let layout: UICollectionViewFlowLayout = .from(self.configuration)
    
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
