/*
 
 Project: CollectionViewer
 File: DataSource+Method+RemoveAll.swift
 Created by: Egor Boyko
 Date: 09.09.2023
 
 Status: #In progress | #Completed
 
 */

import UIKit

extension DataSource{
    func removeAll(_ collectionView: UICollectionView){
        DispatchQueue.main.async { [weak self] in
            guard let count = self?.data.count else {
                return
            }
            let paths: [IndexPath] = (0..<count).map{.init(row: $0, section: 0)}
            self?.data = []
            if self != nil {
                collectionView.performBatchUpdates {
                    collectionView.deleteItems(at: paths)
                }
            }
        }
    }
}
