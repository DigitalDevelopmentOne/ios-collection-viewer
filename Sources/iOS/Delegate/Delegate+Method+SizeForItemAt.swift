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
            if let size = self.sizeStorage[indexPath.item] {
#if DEBUG //----------------------------------------------------------------------------------------
                self.debugMessage(#function, "Size from storage: \(indexPath.item)")
#endif //-------------------------------------------------------------------------------------------
                return size
            }
            guard let content = self.coordinator?.inputData[indexPath.item] else {
                return .zero
            }
#if DEBUG //----------------------------------------------------------------------------------------
            self.debugMessage(#function, "Size calculation: \(indexPath.item)")
#endif //-------------------------------------------------------------------------------------------
            let hosting = UIHostingController(rootView: content())
            hosting.configure(size: self.coordinator?.ownerSize)
            self.sizeStorage[indexPath.item] = hosting.view.frame.size
            return hosting.view.frame.size
        }
}
