//
//  AvatarImageView.swift
//  Expensiv Tracker
//
//  Created by Fabrizio Chiariello on 3/24/23.
//
// UI DESING

import UIKit

class AvatarImageView: UIImageView {

    let placeHolderImage = Images.placeHolderImage
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(color: UIColor, icon img: String, mode: UIView.ContentMode) {
        self.init(frame: .zero)
        contentMode = mode
        image = UIImage(systemName: img)
        tintColor = color
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configImage() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        image = placeHolderImage
    }
    
    
    
    
}
