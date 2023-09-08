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
        
        if self.views.isEmpty {
            coordinator.inputData = []
            uiCollection.dataSource = nil
            coordinator.dataSource?.data = []
            uiCollection.dataSource = coordinator.dataSource
        } else if coordinator.inputData.isEmpty {
            coordinator.inputData = self.views
            uiCollection.dataSource = nil
            coordinator.dataSource?.updateData(newData: self.views)
            uiCollection.dataSource = coordinator.dataSource
        } else if coordinator.inputData.count == coordinator.dataSource?.data.count {
            coordinator.inputData = self.views
            coordinator.dataSource?.updateData(newData: self.views)
            coordinator.dataSource?.update(uiCollection)
        } else {
            coordinator.inputData = self.views
        }
        
        if let refresher = self.configuration.refresher,
           uiCollection.refresher == nil
        {
#if DEBUG //----------------------------------------------------------------------------------------
        self.debugMessage(#function, "Add Refresher")
#endif //-------------------------------------------------------------------------------------------
            refresher.refreshControl.addTarget(
                refresher,
                action: #selector(refresher.action),
                for: .valueChanged
            )
            uiCollection.refresher = refresher
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
