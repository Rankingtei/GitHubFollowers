//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Tei Akpotosu-Nartey on 6/16/22.
//

import UIKit

extension UIViewController{
   func  presentGFAlertOnMainThread(title:String, message: String, buttonTitle: String){
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message,  buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
        
    
}
