//
//  SearchVC.swift
//  GitHubFollowers
//
//  Created by Tei Akpotosu-Nartey on 6/15/22.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let calltoActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUserNameEntered: Bool {
        return !usernameTextField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) 
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    
    }
    
        @objc func pushFollowerListVC(){
            guard isUserNameEntered  else {
                presentGFAlertOnMainThread(title: "Empty Username", message: "Please Enter a username or i will kil you sf", buttonTitle: "ok")
                return
            }
            let followerListVC = FollowerListVC()
            followerListVC.username = usernameTextField.text
            followerListVC.title = usernameTextField.text
            navigationController?.pushViewController(followerListVC, animated: true)
            
        }
    
    func configureLogoImageView(){
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
        
        func configureTextField() {
            view.addSubview(usernameTextField)
            usernameTextField.delegate = self
            
            NSLayoutConstraint.activate([
                usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
                usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                usernameTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
    func configureCallToActionButton(){
        view.addSubview(calltoActionButton)
        calltoActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            calltoActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:  -50),
            calltoActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            calltoActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            calltoActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


extension SearchVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
