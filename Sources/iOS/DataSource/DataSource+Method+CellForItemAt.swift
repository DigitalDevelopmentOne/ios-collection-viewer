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
            cell.setView(view: content, size: self.coordinator?.ownerSize)
            return cell
    }
}
