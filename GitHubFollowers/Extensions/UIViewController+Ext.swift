//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Tei Akpotosu-Nartey on 6/16/22.
//

import UIKit
import SafariServices

fileprivate var containerView: UIView!

extension UIViewController{
   func  presentGFAlertOnMainThread(title:String, message: String, buttonTitle: String){
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message,  buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func presentSafariVC(with url: URL){
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
        
    }
    
        
    func showLoadingView(){
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.35) { containerView.alpha = 0.8}
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView(){
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
        
    }
    
    func showEmptyStateView(with message: String, in view: UIView){
        let emptyStateView = GFEmptyState(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
}

extension Data{
    var prettyPrintedJSONString: NSString? {
         guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
               let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
               let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

         return prettyPrintedString
     }
}
