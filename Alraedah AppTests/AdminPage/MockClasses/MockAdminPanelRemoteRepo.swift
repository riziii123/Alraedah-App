// Created on 12/08/2022
// Copyright © 2022 Rizwan

import Foundation
@testable import Alraedah_App
import XCTest


class MockAdminPanelRemoteRepo: UseCaseToRemoteRepoContract {
    
    var expectation: XCTestExpectation?
    
    func fetchRemoteData() {
        expectation?.fulfill()
    }
}
