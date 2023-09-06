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
        
        if context.coordinator.inputData.count != self.views.count {
            
            if context.coordinator.inputData.count == context.coordinator.dataSource?.data.count {
                context.coordinator.inputData = self.views
                context.coordinator.dataSource?.update(uiView)
            } else {
                context.coordinator.inputData = self.views
            }
        }
        
        guard context.coordinator.dataSource == nil  else {
            return
        }
        

        let dataSource: DataSource<Content>
        if self.views.count > 50 {
            dataSource = DataSource(data: self.views[0...50].map{$0})
        } else {
            dataSource = DataSource(data: self.views)
        }
        
        let prefetchDataSource = PrefetchDataSource<Content>()
        let delegate = Delegate<Content>()
        
        prefetchDataSource.coordinator = context.coordinator
        dataSource.coordinator = context.coordinator
        delegate.coordinator = context.coordinator
        
        context.coordinator.ownerSize = ownerSize

        context.coordinator.dataSource = dataSource
        context.coordinator.prefetchDataSource = prefetchDataSource
        context.coordinator.delegate = delegate
        
        uiView.dataSource = dataSource
        uiView.delegate = delegate
        uiView.prefetchDataSource = prefetchDataSource
        uiView.register(Cell<Content>.self, forCellWithReuseIdentifier: "\(Cell<Content>.self)")
        uiView.decelerationRate = .init(rawValue: 0.9987)
        uiView.showsVerticalScrollIndicator = false
        print(uiView.decelerationRate)
 
    }
}
