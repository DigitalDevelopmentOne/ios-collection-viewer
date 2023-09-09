/*
 
 Project: CollectionViewer
 File: Refresher.swift
 Created by: Egor Boyko
 Date: 08.09.2023
 
 Status: #In progress | #Not required
 
 */

import UIKit

public final class Refresher: NSObject {
    init(
        action: @escaping (_ completed: @escaping ()->()) -> (),
        refreshControl: UIRefreshControl){
            self.value = action
            self.refreshControl = refreshControl
        }
    var refreshControl: UIRefreshControl
    var value: (@escaping ()->()) -> ()
    @objc func action(_ refresher: Refresher){
        self.value{ [weak self] in
            self?.completed()
        }
    }
    public func completed(){
        self.refreshControl.endRefreshing()
    }
}
