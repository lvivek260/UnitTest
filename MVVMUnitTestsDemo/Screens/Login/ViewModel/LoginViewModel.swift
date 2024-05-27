//
//  LoginViewModel.swift
//  LoginMVVMUnitText
//
//  Created by PHN MAC 1 on 27/05/24.
//

import Foundation

final class LoginViewModel{
    private let validationManager = ValidationManager()
    
    
    func validateEmailPassword(loginModel: LoginModel) -> ValidationResult{
        let emailValidation = validationManager.email(loginModel.emailId)
        let passwordValidation = validationManager.password(loginModel.password)
        
        return !emailValidation.isSuccess ? emailValidation : passwordValidation
    }
}
