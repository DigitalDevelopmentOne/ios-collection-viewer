/*
 
 Project: CollectionViewer
 File: DataSource+Method+LoadingAfterUpdate.swift
 Created by: Egor Boyko
 Date: 09.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

extension DataSource{
    func loadingAfterUpdate(_ collectionView: UICollectionView){
        DispatchQueue.main.async {
            let paths: [IndexPath] = (0..<self.data.count).map {
                .init(row: $0, section: 0)
            }
            collectionView.performBatchUpdates {
                collectionView.insertItems(at: paths)
            }
        }
    }
}
