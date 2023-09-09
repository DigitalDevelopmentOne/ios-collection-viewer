/*
 
 Project: CollectionViewer
 File: DataSource+Method+Update.swift
 Created by: Egor Boyko
 Date: 09.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

extension DataSource{
    func update(data input:  [() -> Content]){
        if self.data.isEmpty {
            self.data = input.count > 50 ? input[0...50].map{$0} : input
        }
        if input.count < self.data.count {
            return
        }
        self.data = input[0..<self.data.count].map{$0}
    }
}
