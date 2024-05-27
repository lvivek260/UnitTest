//
//  SignUpViewModel.swift
//  LoginMVVMUnitText
//
//  Created by PHN MAC 1 on 27/05/24.
//

import Foundation

final class SignUpViewModel{
    private let validation = ValidationManager()
    
    func validationCheck(signUpModel: SignUpModel) -> ValidationResult{
        let firstName = validation.name(signUpModel.firstName)
        let lastName = validation.name(signUpModel.lastName)
        let email = validation.email(signUpModel.email)
        let password = validation.password(signUpModel.password)
        
        guard firstName.isSuccess else{
            return .init(error: "Please enter first name", isSuccess: false)
        }
        
        guard lastName.isSuccess else{
            return .init(error: "Please enter last name", isSuccess: false)
        }
        
        guard email.isSuccess else {
            return email
        }
        
        guard password.isSuccess else {
            return password
        }
        
        return .init(error: nil, isSuccess: true)
    }
}
