/*
 
 Project: CollectionViewer
 File: Style.swift
 Created by: Egor Boyko
 Date: 08.09.2023
 
 Status: #In progress | #Not required
 
 */

import UIKit

public protocol Style: Equatable {
    var minimumLineSpacing: CGFloat { get set }
    var minimumInteritemSpacing: CGFloat { get set}
    var itemSize: CGSize? { get set }
    var scrollDirection: UICollectionView.ScrollDirection { get set }
}
