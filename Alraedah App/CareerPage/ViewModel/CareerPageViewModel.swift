// Created on 11/08/2022
// Copyright © 2022 Rizwan

import Foundation

class CareerPageViewModel: CareerPageViewToViewModelContract {
    var useCase: CareerPageViewModelToUseCaseContract?
    var view: CareerPageViewModelToViewContract?
    
    init(useCase: CareerPageViewModelToUseCaseContract) {
        self.useCase = useCase
    }
    
    func loadData() {
        useCase?.fetchData()
    }
    
    func submitResume() {
        useCase?.uploadResume()
    }
}

extension CareerPageViewModel: CareerPageUseCaseToViewModelContract {
    func fetchDataSuccess(application: CareerApplication) {
        view?.loadDataSuccess(application: application)
    }
    
    func fetchDataFailure(error: String) {
        
    }
    
    
}
