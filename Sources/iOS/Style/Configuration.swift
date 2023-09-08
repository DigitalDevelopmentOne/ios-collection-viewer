/*
 
 Project: CollectionViewer
 File: Configuration.swift
 Created by: Egor Boyko
 Date: 08.09.2023
 
 Status: #In progress | #Not required
 
 */

import UIKit

public protocol Configuration: Equatable {
    var gridColumns: CGFloat? { get set }
    var minimumLineSpacing: CGFloat { get set }
    var minimumInteritemSpacing: CGFloat { get set}
    var itemSize: CGSize? { get set }
    var scrollDirection: UICollectionView.ScrollDirection { get set }
    var sizeCaching: Bool { get set }
    var refresAction: RefresActionStorage? { get set }
}

public final class RefresActionStorage: NSObject {
    override init(){
        self.value = {}
        super.init()
    }
    init(action: @escaping () -> ()){
        self.value = action
    }
    var value: () -> ()
    @objc func action(){
        self.value()
    }
}
