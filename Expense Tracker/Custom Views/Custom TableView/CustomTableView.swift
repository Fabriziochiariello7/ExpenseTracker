//
//  CustomTableViewController.swift
//  Expensiv Tracker
//
//  Created by Fabrizio Chiariello on 3/24/23.
//

import UIKit

class CustomTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(indicator: Bool, separtorStyle: UITableViewCell.SeparatorStyle, _ clas: AnyClass?, forCellReuseIdentifier: String) {
        self.init(frame: .zero, style: .plain)
        showsVerticalScrollIndicator = indicator
        translatesAutoresizingMaskIntoConstraints = false
        separatorStyle = separtorStyle
//        register(nib, forCellReuseIdentifier: forCellReuseIdentifier)
        register(clas, forCellReuseIdentifier: forCellReuseIdentifier)
    }
    
    private func configTable() {
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        separatorStyle = .singleLine
    }
}
