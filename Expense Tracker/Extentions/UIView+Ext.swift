//
//  UIView+Ext.swift
//  Expensiv Tracker
//
//  Created by Fabrizio Chiariello on 3/24/23.
//

// UI DESING

import UIKit

extension UIView {
    
    func pinToEdges(to superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
    
    func addSubViews(_ views: UIView...) {
        for view in views { addSubview(view)}
    }
    
}

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views { addArrangedSubview(view)}
    }
}
