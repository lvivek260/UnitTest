//
//  SignUpViewModelTests.swift
//  MVVMUnitTestsDemoTests
//
//  Created by PHN MAC 1 on 27/05/24.
//

import XCTest
@testable import MVVMUnitTestsDemo

final class SignUpViewModelTests: XCTestCase {
    
    var viewModel: SignUpViewModel?

//MARK: - Default Methods
    override func setUpWithError() throws {
        viewModel = SignUpViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

//MARK: - Invalid Test Cases
    func testInvalidFirstName(){
        guard let viewModel else {
            XCTFail("ViewModel Cannot be nil")
            return
        }
        let model1 = SignUpModel(firstName: nil, lastName: "XYZ", email: "vivek@gmail.com", password: "Vivek@123")
        let model2 = SignUpModel(firstName: "", lastName: "XYZ", email: "vivek@gmail.com", password: "Vivek@123")
        
        let result1 = viewModel.validationCheck(signUpModel: model1).isSuccess
        let result2 = viewModel.validationCheck(signUpModel: model2).isSuccess
        
        XCTAssertEqual(result1, false)
        XCTAssertEqual(result2, false)
    }
    
    
    func testInvalidLastName(){
        guard let viewModel else {
            XCTFail("ViewModel Cannot be nil")
            return
        }
        let model1 = SignUpModel(firstName: "Vivek", lastName: nil, email: "vivek@gmail.com", password: "Vivek@123")
        let model2 = SignUpModel(firstName: "Vivek", lastName: "", email: "vivek@gmail.com", password: "Vivek@123")
        
        let result1 = viewModel.validationCheck(signUpModel: model1).isSuccess
        let result2 = viewModel.validationCheck(signUpModel: model2).isSuccess
        
        XCTAssertEqual(result1, false)
        XCTAssertEqual(result2, false)
    }
    
    
    func testInvalidEmail(){
        guard let viewModel else {
            XCTFail("ViewModel Cannot be nil")
            return
        }
        let model1 = SignUpModel(firstName: "Vivek", lastName: "Lokhande", email: nil, password: "Vivek@123")
        let model2 = SignUpModel(firstName: "Vivek", lastName: "Lokhande", email: "", password: "Vivek@123")
        let model3 = SignUpModel(firstName: "Vivek", lastName: "Lokhande", email: "vievk", password: "Vivek@123")
        let model4 = SignUpModel(firstName: "Vivek", lastName: "Lokhande", email: "vivek@123", password: "Vivek@123")
        let model5 = SignUpModel(firstName: "Vivek", lastName: "Lokhande", email: "vivek.com", password: "Vivek@123")
        let model6 = SignUpModel(firstName: "Vivek", lastName: "Lokhande", email: "vivek.com@123", password: "Vivek@123")

        let result1 = viewModel.validationCheck(signUpModel: model1).isSuccess
        let result2 = viewModel.validationCheck(signUpModel: model2).isSuccess
        let result3 = viewModel.validationCheck(signUpModel: model3).isSuccess
        let result4 = viewModel.validationCheck(signUpModel: model4).isSuccess
        let result5 = viewModel.validationCheck(signUpModel: model5).isSuccess
        let result6 = viewModel.validationCheck(signUpModel: model6).isSuccess
        
        XCTAssertEqual(result1, false)
        XCTAssertEqual(result2, false)
        XCTAssertEqual(result3, false)
        XCTAssertEqual(result4, false)
        XCTAssertEqual(result5, false)
        XCTAssertEqual(result6, false)
    }
    
    
    func testInvalidPassword(){
        guard let viewModel else {
            XCTFail("ViewModel Cannot be nil")
            return
        }
        let model1 = SignUpModel(firstName: "Vivek", lastName: "Lokhande", email: "vivek@gmail.com", password: nil)
        let model2 = SignUpModel(firstName: "Vivek", lastName: "Lokhande", email: "vivek@gmail.com", password: "")
        let model3 = SignUpModel(firstName: "Vivek", lastName: "Lokhande", email: "vivek@gmail.com", password: "vivek123")
        let model4 = SignUpModel(firstName: "Vivek", lastName: "Lokhande", email: "vivek@gmail.com", password: "12345678")
        let model5 = SignUpModel(firstName: "Vivek", lastName: "Lokhande", email: "vivek@gmail.com", password: "vivek")
        let model6 = SignUpModel(firstName: "Vivek", lastName: "Lokhande", email: "vivek@gmail.com", password: "Vi@123")
       
        let result1 = viewModel.validationCheck(signUpModel: model1).isSuccess
        let result2 = viewModel.validationCheck(signUpModel: model2).isSuccess
        let result3 = viewModel.validationCheck(signUpModel: model3).isSuccess
        let result4 = viewModel.validationCheck(signUpModel: model4).isSuccess
        let result5 = viewModel.validationCheck(signUpModel: model5).isSuccess
        let result6 = viewModel.validationCheck(signUpModel: model6).isSuccess
        
        XCTAssertEqual(result1, false)
        XCTAssertEqual(result2, false)
        XCTAssertEqual(result3, false)
        XCTAssertEqual(result4, false)
        XCTAssertEqual(result5, false)
        XCTAssertEqual(result6, false)
    }
    
    //MARK: - Valid Test Cases
    func testValidFirstName(){
        checkAllValid()
    }

    func testValidLastName(){
        checkAllValid()
    }
    
    func testValidEmail(){
        checkAllValid()
    }
    
    func testValidPassword(){
        checkAllValid()
    }
    
    private func checkAllValid(){
        guard let viewModel else {
            XCTFail("ViewModel Cannot be nil")
            return
        }
        let model1 = SignUpModel(firstName: "Vivek", lastName: "Lokhande", email: "vivek@gmail.com", password: "Vivek@123")
        let result1 = viewModel.validationCheck(signUpModel: model1).isSuccess
        XCTAssertEqual(result1, true)
    }
}
