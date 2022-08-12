// Created on 12/08/2022
// Copyright © 2022 Rizwan

import Foundation
@testable import Alraedah_App
import XCTest

class MockAdminPanelViewController: ViewModelToViewContract {
    
    var successExpectation: XCTestExpectation?
    var failureExpectation: XCTestExpectation?
    
    func loadDataSuccess(items: [ApplicationModel]) {
        successExpectation?.fulfill()
    }
    
    func loadDataFailure() {
        failureExpectation?.fulfill()
    }
}
