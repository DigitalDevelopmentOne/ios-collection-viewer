/*
 
 Project: CollectionViewer
 File: DataSource.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

final class DataSource<Content: View>: NSObject, UICollectionViewDataSource, Logging {
    init(data input: [() -> Content], coordinator: Coordinator<Content>) {
        self.data = input.count > 50 ? input[0...50].map{$0} : input
        self.coordinator = coordinator
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
