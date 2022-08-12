// Created on 12/08/2022
// Copyright © 2022 Rizwan

import Foundation
@testable import Alraedah_App
import XCTest

class MockAdminPanelUseCase: ViewModelToUseCaseContract {
    
    var expectation: XCTestExpectation?
    var remoteSuccessExpectation: XCTestExpectation?
    var remoteFailureExpectation: XCTestExpectation?
    
    func fetchData() {
        expectation?.fulfill()
    }
}

extension MockAdminPanelUseCase: RemoteRepoToUseCaseContract {
    
    func fetchRemoteDataSuccess(items: [ApplicationModel]) {
        remoteSuccessExpectation?.fulfill()
    }
    
    func fetchRemoteDataFailure(error: String) {
        remoteFailureExpectation?.fulfill()
    }
    
    
}
