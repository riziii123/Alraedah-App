// Created on 12/08/2022
// Copyright © 2022 Rizwan

import Foundation
@testable import Alraedah_App
import XCTest

class MockAdminPanelViewModel: UseCaseToViewModelContract {
    
    var successExpectation: XCTestExpectation?
    var failureExpectation: XCTestExpectation?
    
    func fetchDataSuccess(items: [ApplicationModel]) {
        successExpectation?.fulfill()
    }
    
    func fetchDataFailure(error: String) {
        failureExpectation?.fulfill()
    }
}
