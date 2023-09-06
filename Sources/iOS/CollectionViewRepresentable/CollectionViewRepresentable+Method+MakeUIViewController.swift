/*
 
 Project: CollectionViewer
 File: CollectionViewRepresentable+Method+MakeUIViewController.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

extension CollectionViewRepresentable {
    func makeUIView(context: Context) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        
        return .init(frame: .init(origin: .zero, size: ownerSize), collectionViewLayout: layout)
    }
}
