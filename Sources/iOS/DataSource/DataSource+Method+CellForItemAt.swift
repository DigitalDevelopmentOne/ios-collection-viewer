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
            guard let collection = collectionView as? AuxiliaryUICollectionView else {
                fatalError("Must use AuxiliaryUICollectionView")
            }
            
            guard let layout = collection.collectionViewLayout as? UICollectionViewFlowLayout else {
                fatalError("Must use UICollectionViewFlowLayout")
            }
            
            let content = self.data[indexPath.item]
            
            if layout.itemSize != .init(width: 1, height: 1) {
#if DEBUG //----------------------------------------------------------------------------------------
                self.debugMessage(#function, "Set fixed size. Item: \(indexPath.item)")
#endif //-------------------------------------------------------------------------------------------
                cell.setView(view: content, fixedSize: layout.itemSize)
                return cell
            }
            let ownerSize: CGSize
            if let gridColumns = collection.gridColumns {
                let spacing = layout.minimumLineSpacing * (gridColumns - 1)
                let contentWidth = collection.frame.width - spacing
                ownerSize = .init(
                    width: (contentWidth - spacing) / gridColumns,
                    height: self.coordinator?.ownerSize.height ?? 0
                )
            } else {
                ownerSize = self.coordinator?.ownerSize ?? .zero
            }
            
#if DEBUG //----------------------------------------------------------------------------------------
            self.debugMessage(#function, "Set Calculated size. Item: \(indexPath.item)")
#endif //-------------------------------------------------------------------------------------------
            cell.setView(view: content, size: ownerSize)
            
            return cell
        }
}
