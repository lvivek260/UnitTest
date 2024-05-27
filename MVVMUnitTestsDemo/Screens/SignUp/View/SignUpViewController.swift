//
//  SignUpViewController.swift
//  LoginMVVMUnitText
//
//  Created by PHN MAC 1 on 27/05/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
//MARK: - IBOultets
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    let viewModel = SignUpViewModel()
    
    
//MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
//MARK: - IBActions
    @IBAction func didSignUpBtnClick(_ sender: Any) {
        let signUpModel = SignUpModel(
            firstName: txtFirstName.text,
            lastName: txtLastName.text,
            email: txtEmailId.text,
            password: txtPassword.text)
        let validationResult = viewModel.validationCheck(signUpModel: signUpModel)
        
        guard validationResult.isSuccess else {
            showAlert("Error", validationResult.error)
            return
        }
       
        showAlert("Success", "SignUp Successfully Complete"){
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}

