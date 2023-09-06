/*
 
 Project: CollectionViewer
 File: CollectionViewRepresentable.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

struct CollectionViewRepresentable<Content: View>: UIViewRepresentable {
    let views: [() -> Content]
    let ownerSize: CGSize
}
