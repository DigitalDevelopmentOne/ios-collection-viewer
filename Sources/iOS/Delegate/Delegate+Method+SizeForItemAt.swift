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
            guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
                self.warningMessage(#function, "Must use UICollectionViewFlowLayout")
                return .zero
            }
            
            if layout.itemSize != .init(width: 1, height: 1) {
                return layout.itemSize
            }
            
            guard let collection = collectionView as? AuxiliaryUICollectionView else {
                self.warningMessage(#function, "Must use AuxiliaryUICollectionView")
                return .zero
            }
            
            if collection.sizeCaching, let size = self.sizeStorage[indexPath.item] {
                return size
            }
            
            guard let coordinator, coordinator.inputData.count >= indexPath.item else {
                self.warningMessage(#function, "Index out of range: \(indexPath.item)")
                return .zero
            }

            let hosting = UIHostingController(rootView: coordinator.inputData[indexPath.item]())
            
            let ownerSize: CGSize
            let size: CGSize
            if let gridColumns = collection.gridColumns {
                let spacing = layout.minimumInteritemSpacing * (gridColumns - 1)
                let contentWidth = collection.frame.width - spacing
                ownerSize = .init(
                    width: (contentWidth - spacing) / gridColumns,
                    height: self.coordinator?.ownerSize.height ?? 0
                )
                size = .init(
                    width: ownerSize.width,
                    height: hosting.configure(size: ownerSize).height
                )
            } else {
                ownerSize = self.coordinator?.ownerSize ?? .zero
                size = hosting.configure(size: ownerSize)
            }
            self.sizeStorage[indexPath.item] = size
            return size
        }
}
