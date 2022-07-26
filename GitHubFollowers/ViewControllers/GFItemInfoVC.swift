//
//  GFItemInfoVC.swift
//  GitHubFollowers
//
//  Created by Tei Akpotosu-Nartey on 6/23/22.
//

import UIKit

class GFItemInfoVC: UIViewController {
    
    let stackVIew = UIStackView()
    let itemInfoViewOne = GFItemInfoView()
    let itemInfoViewTwo = GFItemInfoView()
    let actionButton = GFButton()
    
    var user: User!
    weak var delegate: userInfoVCDelegate!
    
    
    init(user: User){
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        configureActionButton()
        layoutUI()
        configureStackView()
}
    
    func configureBackgroundView(){
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
        
    }
    
    private func configureStackView(){
        stackVIew.axis = .horizontal
        stackVIew.distribution = .equalSpacing
        
        stackVIew.addArrangedSubview(itemInfoViewOne)
        stackVIew.addArrangedSubview(itemInfoViewTwo)
    }
    
    private func configureActionButton(){
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    @objc func actionButtonTapped(){}
    
    private func layoutUI(){
        view.addSubview(stackVIew)
        view.addSubview(actionButton)
       
        
        stackVIew.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 30
        
        NSLayoutConstraint.activate([
            stackVIew.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            stackVIew.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackVIew.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackVIew.heightAnchor.constraint(equalToConstant: 50),
            
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
            
        ])
        
        
    }
}
