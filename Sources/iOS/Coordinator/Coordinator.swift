/*
 
 Project: CollectionViewer
 File: Coordinator.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

final class Coordinator<Content: View> {
    init(inputData: [() -> Content] = [], ownerSize: CGSize = .zero) {
        self.inputData = inputData
        self.ownerSize = ownerSize
    }
    var inputData: [() -> Content]
    var ownerSize: CGSize
    var dataSource: DataSource<Content>?
    var delegate: Delegate<Content>?
    var prefetchDataSource: PrefetchDataSource<Content>?
}
