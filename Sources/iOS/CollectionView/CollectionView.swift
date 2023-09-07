/*
 
 Project: CollectionViewer
 File: CollectionViewRepresentable.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

public struct CollectionView<Collection: RandomAccessCollection, Content: View>: View {
    init(views: [() ->Content]) {
        self.views = views
    }
    let views: [() -> Content]
    var scrollDirection: UICollectionView.ScrollDirection = .vertical
    var itemSize: CGSize?
    
    public func scrollDirection(_ value: UICollectionView.ScrollDirection) -> Self {
        var view = self
        view.scrollDirection = value
        return view
    }
    
    public func itemSize(_ value: CGSize?) -> Self {
        var view = self
        view.itemSize = value
        return view
    }
    
    public var body: some View {
        GeometryReader{
            CollectionViewRepresentable<Content>(
                views: self.views,
                ownerSize: $0.size,
                scrollDirection: self.scrollDirection,
                itemSize: self.itemSize
            )
        }
    }
}

extension CollectionView {
    public init(
        _ collection: Collection,
        @ViewBuilder content: @escaping (
            _ index: Collection.Index,
            _ element: Collection.Element) -> Content){
                let views = Array(zip(collection.indices, collection)).map { (index, element) in
                    { content(index, element) }
                }
                self.init(views: views)
            }
}
