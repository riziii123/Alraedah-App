// Created on 10/08/2022
// Copyright © 2022 Rizwan

import Foundation


class AdminPanelViewModel: ViewToViewModelContract {
    
    var useCase: ViewModelToUseCaseContract?
    weak var view: ViewModelToViewContract?
    
    init(useCase: ViewModelToUseCaseContract) {
        self.useCase = useCase
    }
    
    func loadData() {
        useCase?.fetchData()
    }
}

extension AdminPanelViewModel: UseCaseToViewModelContract {
    
    func fetchDataSuccess(items: [ApplicationModel]) {
        view?.loadDataSuccess(items: items)
    }
    
    func fetchDataFailure(error: String) {
        
    }
    
    
}
