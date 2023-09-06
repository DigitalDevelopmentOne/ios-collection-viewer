/*
 
 Project: CollectionViewer
 File: CollectionViewRepresentable+Method+UpdateUIView.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

extension CollectionViewRepresentable {
    func updateUIView(_ uiView: UICollectionView, context: Context) {
        let dataSource = DataSource(data: self.views)
        let prefetchDataSource = PrefetchDataSource<Content>()
        let delegate = Delegate<Content>()
        
        prefetchDataSource.coordinator = context.coordinator
        dataSource.coordinator = context.coordinator
        delegate.coordinator = context.coordinator
        
        context.coordinator.ownerSize = ownerSize
        context.coordinator.inputData = self.views
        context.coordinator.dataSource = dataSource
        context.coordinator.prefetchDataSource = prefetchDataSource
        context.coordinator.delegate = delegate
        
        uiView.dataSource = dataSource
        uiView.delegate = delegate
        uiView.prefetchDataSource = prefetchDataSource
        uiView.register(Cell<Content>.self, forCellWithReuseIdentifier: "\(Cell<Content>.self)")
        uiView.showsVerticalScrollIndicator = false
 
    }
}
