//
//  ViewController.swift
//  LoginMVVMUnitText
//
//  Created by PHN MAC 1 on 27/05/24.
//

import UIKit

class LoginViewController: UIViewController {
//MARK: - IBOulets
    @IBOutlet weak private var txtEmailId: UITextField!
    @IBOutlet weak private var txtPassword: UITextField!
    @IBOutlet weak private var lblFooter: UILabel!
    private let viewModel = LoginViewModel()

    
//MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configFooterLbl()
    }

    
//MARK: - IBActions
    @IBAction private func signInButtonTapped(){
        let loginModel = LoginModel(emailId: txtEmailId.text, password: txtPassword.text)
        let validation = viewModel.validateEmailPassword(loginModel: loginModel)
        
        guard validation.isSuccess else{
            showAlert("Error", validation.error)
            return
        }
        
        let homeVC = AppStoryboard.home.getViewController(HomeViewController.self)
        if let window = getWindow(){
            window.rootViewController = homeVC
            window.makeKeyAndVisible()
        }
    }
    
//MARK: - Configurations Methods
    func configFooterLbl(){
        let textstr = "Don’t have an acount? Sign Up here"
        lblFooter.text = textstr
        let colorAttriString = NSMutableAttributedString(string: textstr)
        let range = (textstr as NSString).range(of: "Sign Up here")
        colorAttriString.addAttribute(.foregroundColor, value: UIColor.lightGreen, range: range)
        lblFooter.attributedText = colorAttriString
       
        //add gesture Recognizer sentence
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(self.signUpBtnClick(gesture:)))
        lblFooter.isUserInteractionEnabled = true
        lblFooter.addGestureRecognizer(tapAction)
    }
    
    @objc private func signUpBtnClick(gesture: UITapGestureRecognizer){
        let sentenceRange = ((lblFooter.text ?? "") as NSString).range(of: "Sign Up here")
        if gesture.didTapAttributedTextInLabel(label: lblFooter, inRange: sentenceRange) {
            let signUpVC = AppStoryboard.login.getViewController(SignUpViewController.self)
            self.navigationController?.pushViewController(signUpVC, animated: true)
        }
        
    }
}

