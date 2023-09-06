/*
 
 Project: CollectionViewer
 File: Delegate+Method+SizeForItemAt.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

extension Delegate{
    @inlinable
    func sizeForItemAt(
        _ collectionView: UICollectionView,
        _ collectionViewLayout: UICollectionViewLayout,
        _ indexPath: IndexPath) -> CGSize {
            print("Зашли")
            if let size = self.sizeStorage[indexPath.item] {
                return size
            }
            guard let content = self.coordinator?.inputData[indexPath.item] else {
                return .zero
            }
            let hosting = UIHostingController(rootView: content())
            self.coordinator?.dataSource?.hostingStorage[indexPath.item] = hosting.configure(
                size: self.coordinator?.ownerSize
            )
            self.sizeStorage[indexPath.item] = hosting.view.frame.size
            return hosting.view.frame.size
    }
}
