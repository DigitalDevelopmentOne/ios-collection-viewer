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
            if let layout = collectionViewLayout as? UICollectionViewFlowLayout,
               layout.itemSize != .init(width: 1, height: 1) {
#if DEBUG //----------------------------------------------------------------------------------------
                self.debugMessage(
                    #function,
                    "Fixed cell size defined. Size: \(layout.itemSize)",
                    "Item: \(indexPath.item)"
                )
#endif //-------------------------------------------------------------------------------------------
                return layout.itemSize
            }
            if let size = self.sizeStorage[indexPath.item] {
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
#if DEBUG //----------------------------------------------------------------------------------------
            self.debugMessage(#function, "Size calculation: \(indexPath.item)")
#endif //-------------------------------------------------------------------------------------------
            let hosting = UIHostingController(rootView: coordinator.inputData[indexPath.item]())
            let size = hosting.configure(size: self.coordinator?.ownerSize)
            self.sizeStorage[indexPath.item] = size
#if DEBUG //----------------------------------------------------------------------------------------
            self.debugMessage(#function, "Calculated: \(size)")
#endif //-------------------------------------------------------------------------------------------
            return size
        }
}
