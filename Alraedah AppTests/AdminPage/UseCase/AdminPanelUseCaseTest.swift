// Created on 12/08/2022
// Copyright © 2022 Rizwan

import Foundation
import XCTest
@testable import Alraedah_App

class AdminPanelUseCaseTest: XCTestCase {
    
    private var sut: AdminPanelUseCase?
    private let remoteRepo = MockAdminPanelRemoteRepo()
    private let localRepo = MockAdminPanelLocalRepo()
    private let viewModel = MockAdminPanelViewModel()
    
    private let expectationTimeout: TimeInterval = 0.1
    
    override func setUp() {
        super.setUp()
        
        sut = AdminPanelUseCase(localRepository: localRepo, remoteRepository: remoteRepo)
        sut?.viewModel = viewModel
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func testfetchData() {
        // Given
        let expectation = XCTestExpectation(description: "Repo called")
        remoteRepo.expectation = expectation
        
        // Action
        sut?.fetchData()
        
        // Then
        wait(for: [expectation], timeout: expectationTimeout)
    }
}
