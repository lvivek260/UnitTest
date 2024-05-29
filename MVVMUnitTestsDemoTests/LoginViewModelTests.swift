//
//  LoginViewModelTests.swift
//  MVVMUnitTestsDemoTests
//
//  Created by PHN MAC 1 on 27/05/24.
//

import XCTest
@testable import MVVMUnitTestsDemo

final class LoginViewModelTests: XCTestCase {
    
    var viewModel: LoginViewModel?
    
    override func setUpWithError() throws {
        viewModel = LoginViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
//MARK: - Invalid Test Cases
    func testInvalidEmail(){
        guard let viewModel else {
            XCTFail("ViewModel Cannot be nil")
            return
        }
        
        let loginModel1 = LoginModel(emailId: nil, password: "Vivek@123")
        let loginModel2 = LoginModel(emailId: "", password: "Vivek@123")
        let loginModel3 = LoginModel(emailId: "vivek", password: "Vivek@123")
        let loginModel4 = LoginModel(emailId: "vivek@123", password: "Vivek@123")
        let loginModel5 = LoginModel(emailId: "vivek.com", password: "Vivek@123")
        let loginModel6 = LoginModel(emailId: "vivek.com@123", password: "Vivek@123")
        
        let result1 = viewModel.validateEmailPassword(loginModel: loginModel1).isSuccess
        let result2 = viewModel.validateEmailPassword(loginModel: loginModel2).isSuccess
        let result3 = viewModel.validateEmailPassword(loginModel: loginModel3).isSuccess
        let result4 = viewModel.validateEmailPassword(loginModel: loginModel4).isSuccess
        let result5 = viewModel.validateEmailPassword(loginModel: loginModel5).isSuccess
        let result6 = viewModel.validateEmailPassword(loginModel: loginModel6).isSuccess
        
        XCTAssertFalse(result1)
        XCTAssertFalse(result2)
        XCTAssertFalse(result3)
        XCTAssertFalse(result4)
        XCTAssertFalse(result5)
        XCTAssertFalse(result6)
    }
    
    
    func testInvalidPassword(){
        guard let viewModel else {
            XCTFail("ViewModel Cannot be nil")
            return
        }
        
        let loginModel1 = LoginModel(emailId: "vivek@gmail.com", password: nil)
        let loginModel2 = LoginModel(emailId: "vivek@gmail.com", password: "")
        let loginModel3 = LoginModel(emailId: "vivek@gmail.com", password: "Vivek")
        let loginModel4 = LoginModel(emailId: "vivek@gmail.com", password: "12345678")
        let loginModel5 = LoginModel(emailId: "vivek@gmail.com", password: "vivek123")
        let loginModel6 = LoginModel(emailId: "vivek@gmail.com", password: "123Viv")
        
        let result1 = viewModel.validateEmailPassword(loginModel: loginModel1).isSuccess
        let result2 = viewModel.validateEmailPassword(loginModel: loginModel2).isSuccess
        let result3 = viewModel.validateEmailPassword(loginModel: loginModel3).isSuccess
        let result4 = viewModel.validateEmailPassword(loginModel: loginModel4).isSuccess
        let result5 = viewModel.validateEmailPassword(loginModel: loginModel5).isSuccess
        let result6 = viewModel.validateEmailPassword(loginModel: loginModel6).isSuccess
        
        XCTAssertFalse(result1)
        XCTAssertFalse(result2)
        XCTAssertFalse(result3)
        XCTAssertFalse(result4)
        XCTAssertFalse(result5)
        XCTAssertFalse(result6)
    }
    
//MARK: - Valid Test Cases
     func testValidEmail(){
        guard let viewModel else {
            XCTFail("ViewModel Cannot be nil")
            return
        }
        
        let loginModel1 = LoginModel(emailId: "vivek@gmail.com", password: "vivek@123")
        let loginModel2 = LoginModel(emailId: "vivek@phntechnology.com", password: "vivek@123")
        let loginModel3 = LoginModel(emailId: "shivam@asdkf.rav", password: "vivek@123")
       
        let result1 = viewModel.validateEmailPassword(loginModel: loginModel1).isSuccess
        let result2 = viewModel.validateEmailPassword(loginModel: loginModel2).isSuccess
        let result3 = viewModel.validateEmailPassword(loginModel: loginModel3).isSuccess
     
        XCTAssertTrue(result1)
        XCTAssertTrue(result2)
        XCTAssertTrue(result3)
    }
    
    func testValidPassword(){
       guard let viewModel else {
           XCTFail("ViewModel Cannot be nil")
           return
       }
       
       let loginModel1 = LoginModel(emailId: "vivek@gmail.com", password: "vivek@123")
       let loginModel2 = LoginModel(emailId: "vivek@gmail.com", password: "Vivek@123")
       let loginModel3 = LoginModel(emailId: "vivek@gmail.com", password: "@1234Vivek")
      
       let result1 = viewModel.validateEmailPassword(loginModel: loginModel1).isSuccess
       let result2 = viewModel.validateEmailPassword(loginModel: loginModel2).isSuccess
       let result3 = viewModel.validateEmailPassword(loginModel: loginModel3).isSuccess
    
        XCTAssertTrue(result1)
        XCTAssertTrue(result2)
        XCTAssertTrue(result3)
   }
}
    
