/*
 
 Project: CollectionViewer
 File: FillSpaceModifier+Implementation.swift
 Created by: Egor Boyko
 Date: 09.09.2023
 
 Status: #Completed | #Not required
 
 */

import SwiftUI

extension FillSpaceModifier {
    func makeHorizontal(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
    func makeVertical(content: Content) -> some View {
        VStack{
            Spacer()
            content
            Spacer()
        }
    }
    func makeAll(content: Content) -> some View {
        HStack{
            Spacer()
            VStack{
                Spacer()
                content
                Spacer()
            }
            Spacer()
        }
    }
}
