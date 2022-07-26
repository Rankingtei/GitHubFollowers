//
//  GFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Tei Akpotosu-Nartey on 6/17/22.
//

import UIKit

class GFAvatarImageView: UIImageView {

    let cache = NetworkManager.shared.cache
    let placeholderImage = Images.placeholer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
