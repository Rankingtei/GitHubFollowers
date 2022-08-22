//
//  GFAlertViewController.swift
//  GitHubFollowers
//
//  Created by Tei Akpotosu-Nartey on 6/28/22.
//

import UIKit

class GFAlertContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(){
        layer.cornerRadius = 16
        layer.borderWidth = 2
        backgroundColor = .systemBackground
        layer.borderColor = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
