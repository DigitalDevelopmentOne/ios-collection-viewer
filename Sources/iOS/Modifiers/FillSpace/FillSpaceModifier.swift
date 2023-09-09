/*
 
 Project: CollectionViewer
 File: FillSpaceModifier.swift
 Created by: Egor Boyko
 Date: 09.09.2023
 
 Status: #Completed | #Not decorated
 
 */

import SwiftUI

public struct FillSpaceModifier: ViewModifier {
    init(_ option: Self.Option) {
        self.option = option
    }
    
    let option: Self.Option
    
    public func body(content: Content) -> some View {
        switch option {
        case .horizontal:
            self.makeHorizontal(content: content)
        case .vertical:
            self.makeVertical(content: content)
        case .all:
            self.makeAll(content: content)
        }
    }

}
