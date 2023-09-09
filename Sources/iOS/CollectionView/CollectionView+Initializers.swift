/*
 
 Project: CollectionViewer
 File: CollectionView+Initializers.swift
 Created by: Egor Boyko
 Date: 08.09.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUI

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
