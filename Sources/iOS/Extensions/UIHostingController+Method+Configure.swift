/*
 
 Project: CollectionViewer
 File: UIHostingController+Method+Configure.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

extension UIHostingController {
    @discardableResult
    func configure(size: CGSize?) -> Self {
        let expectedSize = self.sizeThatFits(in: size ?? .zero)
        self.view.backgroundColor = .clear
        self.view.frame = .init(origin: .zero, size: expectedSize)
        return self
    }
}
