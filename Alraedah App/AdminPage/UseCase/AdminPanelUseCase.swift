// Created on 10/08/2022
// Copyright © 2022 Rizwan

import Foundation

class AdminPanelUseCase: ViewModelToUseCaseContract {
    
    var localRepository: UseCaseToLocalRepoContract?
    var remoteRepository: UseCaseToRemoteRepoContract?
    
    weak var viewModel: UseCaseToViewModelContract?
    
    init(localRepository: UseCaseToLocalRepoContract,
         remoteRepository: UseCaseToRemoteRepoContract) {
        self.localRepository = localRepository
        self.remoteRepository = remoteRepository
    }
    
    init() {
        
    }
    
    func fetchData() {
        remoteRepository?.fetchRemoteData()
    }
}

extension AdminPanelUseCase: RemoteRepoToUseCaseContract {
    func fetchRemoteDataSuccess(items: [ApplicationModel]) {
        viewModel?.fetchDataSuccess(items: items)
    }
    
    func fetchRemoteDataFailure(error: String) {
        
    }
}

extension AdminPanelUseCase: LocalRepoToUseCaseContract {
    func fetchLocalDataSuccess(items: [ApplicationModel]) {
        
    }
    
    func fetchLocalDataFailure(error: String) {
        
    }
}
