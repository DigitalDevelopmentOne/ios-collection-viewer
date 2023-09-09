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
    func configureCoordinator(_ uiCollection: AuxiliaryUICollectionView, context: Context) {
        if context.coordinator.isConfigured || self.views.isEmpty { return }
        let coordinator = context.coordinator
        coordinator.isConfigured = true
        coordinator.ownerSize = self.ownerSize
        coordinator.inputData = self.views
        let dataSource: DataSource<Content> = .init(
            data: self.views,
            coordinator: coordinator
        )
        
        let prefetchDataSource = PrefetchDataSource<Content>(coordinator: coordinator)
        let delegate = Delegate<Content>(coordinator: coordinator)
        
        coordinator.dataSource = dataSource
        coordinator.prefetchDataSource = prefetchDataSource
        coordinator.delegate = delegate
        
        uiCollection.backgroundColor = .clear
        uiCollection.dataSource = dataSource
        uiCollection.delegate = delegate
        uiCollection.prefetchDataSource = prefetchDataSource
        uiCollection.register(
            Cell<Content>.self,
            forCellWithReuseIdentifier: "\(Cell<Content>.self)"
        )
        uiCollection.decelerationRate = .normal
        uiCollection.showsVerticalScrollIndicator = false
    }
}
