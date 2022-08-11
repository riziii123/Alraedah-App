// Created on 10/08/2022
// Copyright © 2022 Rizwan

import Foundation
import RealmSwift

class AdminPanelLocalRepo : UseCaseToLocalRepoContract {
    
    var realm: Realm?
    weak var useCase: LocalRepoToUseCaseContract?
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    func fetchLocalData() {
        
    }
    
    func saveData(items: [ApplicationModel]) {
        
    }
    
    
}
