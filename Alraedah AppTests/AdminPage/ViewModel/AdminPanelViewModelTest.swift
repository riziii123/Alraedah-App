// Created on 12/08/2022
// Copyright © 2022 Rizwan

import XCTest
@testable import Alraedah_App

class AdminPanelViewModelTest: XCTestCase {
    
    private var sut: AdminPanelViewModel?
    private let useCase = MockAdminPanelUseCase()
    private let view = MockAdminPanelViewController()
    
    private let expectationTimeout: TimeInterval = 0.1

    override func setUp() {
        super.setUp()
        
        sut = AdminPanelViewModel(useCase: useCase)
        sut?.view = view
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testLoadData() {
        // Given
        let expectation = XCTestExpectation(description: "Usecase called")
        useCase.expectation = expectation
        
        // Action
        sut?.loadData()
        
        // Then
        wait(for: [expectation], timeout: expectationTimeout)
    }

}
