/*
 
 Project: CollectionViewer
 File: PrefetchDataSource.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

final class PrefetchDataSource<Content: View>: NSObject, UICollectionViewDataSourcePrefetching {
    init(coordinator: Coordinator<Content>) {
        self.coordinator = coordinator
    }
    
    weak var coordinator: Coordinator<Content>?

    func collectionView(
        _ collectionView: UICollectionView,
        prefetchItemsAt indexPaths: [IndexPath]) {
            self.prefetchItemsAt(collectionView, indexPaths)
    }
}
