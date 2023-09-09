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
        DispatchQueue.main.async { [weak self] in
            guard let count = self?.data.count else {
                return
            }
            let paths: [IndexPath] = (0..<count).map {
                .init(row: $0, section: 0)
            }
            if self != nil {
                collectionView.performBatchUpdates {
                    collectionView.insertItems(at: paths)
                }
            }
        }
    }
}
