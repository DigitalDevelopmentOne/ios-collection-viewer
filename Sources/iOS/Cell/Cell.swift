/*
 
 Project: CollectionViewer
 File: Cell.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

final class Cell<Content: View>: UICollectionViewCell {
    var hosting: UIHostingController<Content>?
    
    func setView(view: () -> Content, size: CGSize?){
        let hosting = UIHostingController(rootView: view())
        hosting.configure(size: size)
        setHosting(hosting: hosting)
    }
    
    func setHosting(hosting: UIHostingController<Content>){
        contentView.subviews.forEach { $0.removeFromSuperview() }
        DispatchQueue.main.async { [weak self] in //For SwiftUI to notice changes 🙃
            self?.contentView.addSubview(hosting.view)
        }
    }
}

