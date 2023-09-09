/*
 
 Project: CollectionViewer
 File: DataSource+Method+LoadingFromBuffer.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import SwiftUI

extension DataSource{
    func loadingFromBuffer(_ collectionView: UICollectionView){
        DispatchQueue.main.async { [weak self] in
            guard let coordinator = self?.coordinator,
                  let dataCount = self?.data.count,
                  coordinator.inputData.count > dataCount else {
                return
            }
            
            let lastInputDataIndex = coordinator.inputData.count - 1
            let startIndex = dataCount
            let difference = (lastInputDataIndex - startIndex)
            let lastIndex = difference > 50 ? startIndex + 50 : lastInputDataIndex
            
            let newData = coordinator.inputData[startIndex...lastIndex]
            
            var paths = [IndexPath]()
            for item in 0..<newData.count {
                let indexPath = IndexPath(row: item + dataCount, section: 0)
                paths.append(indexPath)
            }
            self?.data.append(contentsOf: newData)
            //We do not allow mutation of the collection if there are manyelements and the
            //element that causes the update is immediately visible
            if self != nil {
                collectionView.performBatchUpdates {
                    collectionView.insertItems(at: paths)
                }
            }
        }
    }
}
