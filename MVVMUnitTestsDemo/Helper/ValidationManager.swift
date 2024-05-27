//
//  Validation.swift
//  Validation_New
//
//  Created by PHN MAC 1 on 13/10/23.
//

import Foundation

struct ValidationResult{
    let error: String?
    let isSuccess: Bool
}

final class ValidationManager{
    
     func email(_ value:String?) -> ValidationResult{
        let email = (value ?? "").trimmingCharacters(in: .whitespaces)
        if email.isEmpty{
            return .init(error: "Email id cannot be empty", isSuccess: false)
        }
        else{
            let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            if !predicate.evaluate(with: email){
                return .init(error: "Email id should be valid", isSuccess: false)
            }
            else{
                return .init(error: nil, isSuccess: true)
            }
        }
    }
    
    func password(_ value: String?) -> ValidationResult {
        let password = (value ?? "").trimmingCharacters(in: .whitespaces)
        if password.isEmpty{
            return .init(error: "Password cannot be empty", isSuccess: false)
        }
        else{
            let reqularExpression = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
            let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            if !predicate.evaluate(with: password){
                return .init(error: "At least minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character", isSuccess: false)
            }
            else{
                return .init(error: nil, isSuccess: true)
            }
        }
    }
    
    func name(_ value: String?) -> ValidationResult {
        let name = (value ?? "").trimmingCharacters(in: .whitespaces)
        if name.isEmpty{
            return .init(error: "Name cannot be empty", isSuccess: false)
        }
        return .init(error: nil, isSuccess: true)
    }
}
