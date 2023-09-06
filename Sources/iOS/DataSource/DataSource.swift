/*
 
 Project: CollectionViewer
 File: DataSource.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

final class DataSource<Content: View>: NSObject, UICollectionViewDataSource, Logging {
    init(data: [() -> Content]) {
        self.data = data
    }
    var data: [() -> Content]
    weak var coordinator: Coordinator<Content>?
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            self.numberOfItemsInSection(collectionView, section)
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            self.cellForItemAt(collectionView, indexPath)
        }
}
