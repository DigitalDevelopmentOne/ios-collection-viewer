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
        self.configuration = .init()
    }
    let views: [() -> Content]
    var configuration: CollectionConfiguration
    public var body: some View {
        GeometryReader{
            CollectionViewRepresentable<Content>(
                views: self.views,
                ownerSize: $0.size,
                configuration: self.configuration
            )
        }
        .ignoresSafeArea()
    }
}


