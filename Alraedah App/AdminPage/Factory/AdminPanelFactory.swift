// Created on 10/08/2022
// Copyright © 2022 Rizwan

import Foundation
import RealmSwift

class AdminPanelFactory: AdminPanelFactoryContract {
    struct RuntimeError: Error {
        let message: String

        init(_ message: String) {
            self.message = message
        }

        public var localizedDescription: String {
            return message
        }
    }
    
    func createAdminPanelViewModel(view: ViewModelToViewContract) throws -> AdminPanelViewModel {
        // Create Remote and local repo
        let remoteRepo = AdminPanelRemoteRepo()
        
        guard let realm = try? Realm() else {
            throw RuntimeError("Unable to initialize realm database")
        }
        let localRepo = AdminPanelLocalRepo(realm: realm)
        
        // Create Usecase
        let useCase = AdminPanelUseCase(localRepository: localRepo,
                                        remoteRepository: remoteRepo)
        remoteRepo.useCase = useCase
        localRepo.useCase = useCase
        
        // Create ViewModel
        let viewModel = AdminPanelViewModel(useCase: useCase)
        viewModel.view = view
        useCase.viewModel = viewModel
        
        return viewModel
    }
}
