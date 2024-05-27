//
//  AppStoryboard.swift
//  LoginMVVMUnitText
//
//  Created by PHN MAC 1 on 27/05/24.
//

import UIKit

enum AppStoryboard: String{
    case login = "Login"
    case home = "Home"
    
    func getViewController<T: UIViewController>(_ viewController: T.Type)-> T{
        let storyboard = UIStoryboard(name: self.rawValue, bundle: nil)
        guard let resultVC = storyboard.instantiateViewController(withIdentifier: viewController.id) as? T else{
            fatalError()
        }
        return resultVC
    }
}
