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
#if DEBUG //----------------------------------------------------------------------------------------
                self.debugMessage(
                    #function,
                    "Fixed cell size defined. Size: \(layout.itemSize)",
                    "Item: \(indexPath.item)"
                )
#endif //-------------------------------------------------------------------------------------------
                return layout.itemSize
            }
            
            guard let collection = collectionView as? AuxiliaryUICollectionView else {
                self.warningMessage(#function, "Must use AuxiliaryUICollectionView")
                return .zero
            }
            
            if collection.sizeCaching, let size = self.sizeStorage[indexPath.item] {
#if DEBUG //----------------------------------------------------------------------------------------
                self.debugMessage(
                    #function,
                    "Size from storage. Size: \(size)",
                    "Item: \(indexPath.item)"
                )
#endif //-------------------------------------------------------------------------------------------
                return size
            }
            
            guard let coordinator, coordinator.inputData.count >= indexPath.item else {
                self.warningMessage(#function, "Index out of range: \(indexPath.item)")
                return .zero
            }

            let hosting = UIHostingController(rootView: coordinator.inputData[indexPath.item]())
            
            let size: CGSize
            if let gridColumns = collection.gridColumns {
#if DEBUG //----------------------------------------------------------------------------------------
            self.debugMessage(#function, "Size calculation (fixed width): \(indexPath.item)")
#endif //-------------------------------------------------------------------------------------------
                let spacing = layout.minimumLineSpacing * (gridColumns - 1)
                let contentWidth = collection.frame.width - spacing
                size = hosting.configure(
                    size: self.coordinator?.ownerSize,
                    width: (contentWidth - spacing) / gridColumns
                )
            } else {
#if DEBUG //----------------------------------------------------------------------------------------
            self.debugMessage(#function, "Size calculation: \(indexPath.item)")
#endif //-------------------------------------------------------------------------------------------
                size = hosting.configure(size: self.coordinator?.ownerSize)
            }
            self.sizeStorage[indexPath.item] = size
#if DEBUG //----------------------------------------------------------------------------------------
            self.debugMessage(#function, "Calculated: \(size)")
#endif //-------------------------------------------------------------------------------------------
            return size
        }
}
