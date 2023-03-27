//
//  AlertContainer.swift
//  Expensiv Tracker
//
//  Created by Fabrizio Chiariello on 3/24/23.
//

import UIKit

class AlertContainerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor     = .systemBackground
        layer.cornerRadius  = 16
        layer.borderWidth   = 2
        layer.borderColor   = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
