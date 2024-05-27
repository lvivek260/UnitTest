//
//  UIViewController+Window.swift
//  LoginMVVMUnitText
//
//  Created by PHN MAC 1 on 27/05/24.
//

import UIKit

extension UIViewController{
    func getWindow() -> UIWindow?{
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window
    }
}


