// Created on 12/08/2022
// Copyright © 2022 Rizwan

import Foundation
@testable import Alraedah_App
import XCTest


class MockAdminPanelLocalRepo: UseCaseToLocalRepoContract {
    
    var expectation: XCTestExpectation?
    
    func saveData(items: [ApplicationModel]) {
        expectation?.fulfill()
    }
    
    func fetchLocalData() {
        expectation?.fulfill()
    }
}
