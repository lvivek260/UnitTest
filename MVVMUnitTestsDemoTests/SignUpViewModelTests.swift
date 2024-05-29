//
//  SignUpViewModelTests.swift
//  MVVMUnitTestsDemoTests
//
//  Created by PHN MAC 1 on 27/05/24.
//

import XCTest
@testable import MVVMUnitTestsDemo

final class SignUpViewModelTests: XCTestCase {
    var viewModel: SignUpViewModel!

    override func setUp() {
        super.setUp()
        viewModel = SignUpViewModel() // Dependency injection
    }

    func testValidationCheck_Success() {
        // Arrange
        let signUpModel = SignUpModel(firstName: "John", lastName: "Doe", email: "john.doe@example.com", password: "Password1!")

        // Act
        let result = viewModel.validationCheck(signUpModel: signUpModel)

        // Assert
        XCTAssertTrue(result.isSuccess)
        XCTAssertNil(result.error)
    }

    func testValidationCheck_FirstNameFailure() {
        // Arrange
        let signUpModel = SignUpModel(firstName: "", lastName: "Doe", email: "john.doe@example.com", password: "Password1!")

        // Act
        let result = viewModel.validationCheck(signUpModel: signUpModel)

        // Assert
        XCTAssertFalse(result.isSuccess)
        XCTAssertEqual(result.error, "Please enter first name")
    }

    func testValidationCheck_LastNameFailure() {
        // Arrange
        let signUpModel = SignUpModel(firstName: "John", lastName: "", email: "john.doe@example.com", password: "Password1!")

        // Act
        let result = viewModel.validationCheck(signUpModel: signUpModel)

        // Assert
        XCTAssertFalse(result.isSuccess)
        XCTAssertEqual(result.error, "Please enter last name")
    }

    func testValidationCheck_EmailFailure() {
        // Arrange
        let signUpModel1 = SignUpModel(firstName: "John", lastName: "Doe", email: "invalid-email", password: "Password1!")
        let signUpModel2 = SignUpModel(firstName: "John", lastName: "Doe", email: nil, password: "Password1!")

        // Act
        let result1 = viewModel.validationCheck(signUpModel: signUpModel1)
        let result2 = viewModel.validationCheck(signUpModel: signUpModel2)

        // Assert
        XCTAssertFalse(result1.isSuccess)
        XCTAssertEqual(result1.error, "Email id should be valid")
        XCTAssertFalse(result2.isSuccess)
        XCTAssertEqual(result2.error, "Email id cannot be empty")
    }

    func testValidationCheck_PasswordFailure() {
        // Arrange
        let signUpModel = SignUpModel(firstName: "John", lastName: "Doe", email: "john.doe@example.com", password: "weak")

        // Act
        let result = viewModel.validationCheck(signUpModel: signUpModel)

        // Assert
        XCTAssertFalse(result.isSuccess)
        XCTAssertEqual(result.error, "At least minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character")
    }
}
