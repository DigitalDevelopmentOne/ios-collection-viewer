/*
 
 Project: CollectionViewer
 File: CollectionViewRepresentable+Method+ConfigureCoordinator.swift
 Created by: Egor Boyko
 Date: 07.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

extension CollectionViewRepresentable {
    @inlinable
    func configureCoordinator(_ uiCollection: UICollectionView, context: Context) {
        if context.coordinator.isConfigured || self.views.isEmpty { return }
        let coordinator = context.coordinator
        coordinator.isConfigured = true
        coordinator.ownerSize = self.ownerSize
#if DEBUG //----------------------------------------------------------------------------------------
        self.debugMessage(#function, "Performed")
#endif //-------------------------------------------------------------------------------------------
        coordinator.inputData = self.views
        let dataSource: DataSource<Content>
        if self.views.count > 50 {
            dataSource = DataSource(
                data: self.views[0...50].map{$0},
                coordinator: coordinator
            )
        } else {
            dataSource = DataSource(
                data: self.views,
                coordinator: coordinator
            )
        }
        
        let prefetchDataSource = PrefetchDataSource<Content>(coordinator: coordinator)
        let delegate = Delegate<Content>(coordinator: coordinator)
        
        coordinator.dataSource = dataSource
        coordinator.prefetchDataSource = prefetchDataSource
        coordinator.delegate = delegate
        
        coordinator.collectionLayout?.scrollDirection = self.scrollDirection
        coordinator.collectionLayout?.itemSize = .init(width: 1, height: 1)
        
        uiCollection.dataSource = dataSource
        uiCollection.delegate = delegate
        uiCollection.prefetchDataSource = prefetchDataSource
        uiCollection.register(
            Cell<Content>.self,
            forCellWithReuseIdentifier: "\(Cell<Content>.self)"
        )
        uiCollection.decelerationRate = .init(rawValue: 0.9987)
        uiCollection.showsVerticalScrollIndicator = false
  
    }
}
