/*
 
 Project: CollectionViewer
 File: AuxiliaryUICollectionView.swift
 Created by: Egor Boyko
 Date: 08.09.2023
 
 Status: #In progress | #Not required
 
 */

import UIKit

final class AuxiliaryUICollectionView: UICollectionView {
    var gridColumns: CGFloat?
    var sizeCaching: Bool = true
    var refreshID: UUID? = nil
}
