/*
 
 Project: CollectionViewer
 File: Delegate.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

final class Delegate<Content: View>:
    NSObject,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout,
    Logging {
    
    weak var coordinator: Coordinator<Content>?
    var sizeStorage: [Int: CGSize] = [:]
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            self.sizeForItemAt(collectionView, collectionViewLayout, indexPath)
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath) {
            self.willDisplay(collectionView, cell,indexPath)
        }
    
}
