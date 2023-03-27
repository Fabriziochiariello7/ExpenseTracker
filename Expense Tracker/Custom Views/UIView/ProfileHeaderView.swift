//
//  ProfileHeaderView.swift
//  Expensiv Tracker
//
//  Created by Fabrizio Chiariello on 3/24/23.
//
// UI DESING

import UIKit

class ProfileHeaderView: UIView {
    
    @IBOutlet var contentView: UIView!
    
   
    var user_fullName   = CustomLabel(textAlignment: .center, fontSize: 22, textWeight: .regular)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    convenience init(user name: String, image userImage: String) {
        self.init(frame: .zero)
        self.user_fullName.text = name
        
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 250)
    }
    
    
    private func commonInit() {
        
        let bundle = Bundle(for: ProfileHeaderView.self)
        bundle.loadNibNamed("ProfileHeaderView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints   = false
       
        user_fullName.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.backgroundColor = .clear
        
        
        user_fullName.text = "Abdorizak Abdalla Hassan"
        
        
        
        NSLayoutConstraint.activate([
            
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            

            
            
            user_fullName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            user_fullName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
        
    }
    
}
