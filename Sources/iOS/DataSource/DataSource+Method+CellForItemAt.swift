/*
 
 Project: CollectionViewer
 File: DataSource+Method+CellForItemAt.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

extension DataSource{
    @inlinable
    func cellForItemAt(
        _ collectionView: UICollectionView,
        _ indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView
                .dequeueReusableCell(
                    withReuseIdentifier: "\(Cell<Content>.self)",
                    for: indexPath
                ) as? Cell<Content> else {
                fatalError("Cell Retrieval")
            }
            
            let content = self.data[indexPath.item]
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout,
               layout.itemSize != .init(width: 1, height: 1) {
#if DEBUG //----------------------------------------------------------------------------------------
                self.debugMessage(#function, "Set fixed size. Item: \(indexPath.item)")
#endif //-------------------------------------------------------------------------------------------
                cell.setView(view: content, fixedSize: layout.itemSize)
            } else {
#if DEBUG //----------------------------------------------------------------------------------------
                self.debugMessage(#function, "Set Calculated size. Item: \(indexPath.item)")
#endif //-------------------------------------------------------------------------------------------
                cell.setView(view: content, size: self.coordinator?.ownerSize)
            }
            return cell
        }
}
