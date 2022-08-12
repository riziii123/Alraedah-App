// Created on 12/08/2022
// Copyright © 2022 Rizwan

import Foundation
import XCTest
@testable import Alraedah_App


class AdminPanelRemoteRepoTest: XCTestCase {
    
    var sut: AdminPanelRemoteRepo?
    let useCase = MockAdminPanelUseCase()
    
    private let expectationTimeout: TimeInterval = 5.0
    
    override func setUp() {
        super.setUp()
        
        sut = AdminPanelRemoteRepo()
        sut?.useCase = useCase
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchRemoteDataSuccess() {
        // Given
        let remoteSuccessExpectation = XCTestExpectation(description: "Remote data success, use case success called")
        useCase.remoteSuccessExpectation = remoteSuccessExpectation
        
        // Action
        sut?.fetchRemoteData()
        
        // Then
        wait(for: [remoteSuccessExpectation], timeout: expectationTimeout)
    }
}
