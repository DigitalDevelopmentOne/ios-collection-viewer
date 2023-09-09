/*
 
 Project: CollectionViewer
 File: View+Modifier+FillSpace.swift
 Created by: Egor Boyko
 Date: 09.09.2023
 
 Status: #Completed | #Not decorated
 
 */

import SwiftUI

public extension View {
    func fillSpace(_ option: FillSpaceModifier.Option) -> some View {
        self.modifier(FillSpaceModifier(option))
    }
}
