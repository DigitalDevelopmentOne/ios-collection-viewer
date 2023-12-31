/*
 
 Project: CollectionViewer
 File: CollectionViewRepresentable+Method+UpdateUIView.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

extension CollectionViewRepresentable {
    func updateUIView(_ uiView: AuxiliaryUICollectionView, context: Context) {
        self.configureCoordinator(uiView, context: context)
        self.updateCoordinator(uiView, context: context)
    }
}
