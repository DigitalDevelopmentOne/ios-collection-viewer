/*
 
 Project: CollectionViewer
 File: Coordinator.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

final class Coordinator<Content: View> {
    init(ownerSize: CGSize = .zero) {
        self.ownerSize = ownerSize
    }
    var ownerSize: CGSize
}
