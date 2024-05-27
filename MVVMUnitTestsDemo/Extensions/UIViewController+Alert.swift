//
//  UIViewController+Alert.swift
//  LoginMVVMUnitText
//
//  Created by PHN MAC 1 on 27/05/24.
//

import UIKit

extension UIViewController{
    func showAlert(_ title: String? = nil,_ message: String? = nil,_ handler: (()->Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okey = UIAlertAction(title: "Okey", style: .default) { action in
            handler?()
        }
        alert.addAction(okey)
        
        present(alert, animated: true)
    }
}
