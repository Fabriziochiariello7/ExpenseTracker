//
//  UITableView+Ext.swift
//  Expensiv Tracker
//
//  Created by Fabrizio Chiariello on 3/24/23.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    

    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
