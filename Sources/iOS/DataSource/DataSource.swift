/*
 
 Project: CollectionViewer
 File: DataSource.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

final class DataSource<Content: View>: NSObject, UICollectionViewDataSource, Logging {
    init(data: [() -> Content], coordinator: Coordinator<Content>) {
        if data.count > 50 {
            self.data = data[0...50].map{$0}
        } else {
            self.data = data
        }
        self.coordinator = coordinator
    }
    var data: [() -> Content]
    weak var coordinator: Coordinator<Content>?
    
    func updateData(newData:  [() -> Content]){
        if newData.count < self.data.count {
            return
        }
        self.data = newData[0...(self.data.count - 1)].map{$0}
    }
    
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
