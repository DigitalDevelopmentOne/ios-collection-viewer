/*
 
 Project: CollectionViewer
 File: CollectionViewRepresentable.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUI

public struct CollectionView<Collection: RandomAccessCollection, Content: View>: View {
    init(views: [() ->Content]) {
        self.views = views
        self.style = .init()
    }
    let views: [() -> Content]
    var style: CollectionStyle
    
    public var body: some View {
        GeometryReader{
            CollectionViewRepresentable<Content>(
                views: self.views,
                ownerSize: $0.size,
                style: self.style
            )
        }
    }
}


