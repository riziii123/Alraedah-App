// Created on 11/08/2022
// Copyright © 2022 Rizwan

import Foundation

class CareerPageUseCase: CareerPageViewModelToUseCaseContract {
    var repo: CareerPageUseCaseToRemoteRepoContract?
    var viewModel: CareerPageUseCaseToViewModelContract?
    
    init(repo: CareerPageUseCaseToRemoteRepoContract) {
        self.repo = repo
    }
    
    func fetchData() {
        repo?.fetchRemoteData()
    }
}

extension CareerPageUseCase: CareerPageRemoteRepoToUseCaseContract {
    func fetchRemoteDataSuccess(application: CareerApplication) {
        viewModel?.fetchDataSuccess(application: application)
    }
    
    func fetchRemoteDataFailure(error: String) {
        
    }
    
    
}
