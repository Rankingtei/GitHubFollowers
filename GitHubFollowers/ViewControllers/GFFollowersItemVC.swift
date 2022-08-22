//
//  GFFollowersItemVC.swift
//  GitHubFollowers
//
//  Created by Tei Akpotosu-Nartey on 6/23/22.
//

import UIKit

class GFFollowersItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        
    }
    
    private func configureItems(){
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
        
        
        
    }
    override func actionButtonTapped() {
        
        delegate.didTapGetFollowers(for: user)
    }
}


