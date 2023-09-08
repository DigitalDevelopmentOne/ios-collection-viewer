/*
 
 Project: CollectionViewer
 File: Refresher.swift
 Created by: Egor Boyko
 Date: 08.09.2023
 
 Status: #In progress | #Not required
 
 */

import UIKit

public final class Refresher: NSObject {
    init(action: @escaping (_ refresher: Refresher) -> (), refreshControl: UIRefreshControl){
        self.value = action
        self.refreshControl = refreshControl
    }
    var refreshControl: UIRefreshControl
    var value: (_ refresher: Refresher) -> ()
    @objc func action(_ refresher: Refresher){
        self.value(self)
    }
    public func completed(){
        self.refreshControl.endRefreshing()
    }
    
    deinit {
        print("Kill")
    }
}
