/*
 
 Project: CollectionViewer
 File: DataSource+Method+Update.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

extension DataSource{
    func update(_ collectionView: UICollectionView){
#if DEBUG //----------------------------------------------------------------------------------------
        self.debugMessage(#function, "Call")
#endif //-------------------------------------------------------------------------------------------
        guard let coordinator = self.coordinator,
              coordinator.inputData.count > self.data.count else {
#if DEBUG //----------------------------------------------------------------------------------------
            self.debugMessage(#function, "No action required")
#endif //-------------------------------------------------------------------------------------------
            return
        }
        let lastInputDataIndex = coordinator.inputData.count - 1
        let startIndex = self.data.count
        let lastIndex = (lastInputDataIndex - startIndex) > 50 ? startIndex + 50 : lastInputDataIndex
        
        let newData = coordinator.inputData[startIndex...lastIndex]
        
        var paths = [IndexPath]()
        for item in 0..<newData.count {
            let indexPath = IndexPath(row: item + data.count, section: 0)
            paths.append(indexPath)
        }
        self.data.append(contentsOf: newData)
        
        //We do not allow mutation of the collection if there are manyelements and the
        //element that causes the update is immediately visible
        DispatchQueue.main.async {
            collectionView.performBatchUpdates {
                collectionView.insertItems(at: paths)
            }
        }
        
    }
}
