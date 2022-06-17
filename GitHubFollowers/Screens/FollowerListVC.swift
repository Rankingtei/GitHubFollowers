//
//  FollowerListVC.swift
//  GitHubFollowers
//
//  Created by Tei Akpotosu-Nartey on 6/15/22.
//

import UIKit

class FollowerListVC: UIViewController {
    
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
     
        NetworkManager.shared.getFollowers(for: username, page: 1) {( followers, errorMessage) in
        
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "bad stuff happened", message: errorMessage!.rawValue, buttonTitle: "ok")
            return
        }
            print("Followers.count = \(followers.count)")
            print(followers)
        }
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
}
