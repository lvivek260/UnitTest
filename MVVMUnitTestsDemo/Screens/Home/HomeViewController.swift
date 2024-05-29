//
//  HomeViewController.swift
//  LoginMVVMUnitText
//
//  Created by PHN MAC 1 on 27/05/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didBackBtnClick(_ sender: UIButton) {
        if let window = getWindow(){
            window.rootViewController = AppStoryboard.login.getViewController(LoginNavigationController.self)
            window.makeKeyAndVisible()
        }
    }
    
}
