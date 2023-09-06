/*
 
 Project: CollectionViewer
 File: DataSource+Method+NumberOfItemsInSection.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

extension DataSource{
    @inlinable
    func numberOfItemsInSection(_ collectionView: UICollectionView, _ section: Int) -> Int {
        print("numberOfItemsInSection: \(self.data.count)")
        return self.data.count
    }
}
