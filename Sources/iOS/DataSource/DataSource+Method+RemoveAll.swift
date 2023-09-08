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
        DispatchQueue.main.async {
            let paths: [IndexPath] = (0..<self.data.count).map{.init(row: $0, section: 0)}
            self.data = []
            collectionView.performBatchUpdates {
                collectionView.deleteItems(at: paths)
            }
        }
    }
}
