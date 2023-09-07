/*
 
 Project: CollectionViewer
 File: CollectionView+Modifiers.swift
 Created by: Egor Boyko
 Date: 08.09.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUI

extension CollectionView {
    public func scrollDirection(_ value: UICollectionView.ScrollDirection) -> Self {
        var view = self
        view.style.scrollDirection = value
        return view
    }
    
    public func itemSize(_ value: CGSize?) -> Self {
        var view = self
        view.style.itemSize = value
        return view
    }
}
