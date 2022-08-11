// Created on 11/08/2022
// Copyright © 2022 Rizwan

import Foundation

class CareerPageFactory {
    
    func getCareerPageViewModel(view: CareerPageViewModelToViewContract) -> CareerPageViewModel {
        let careerPageRemoteRepo = CareerPageRemoteRepo()
        
        let careerPageUseCase = CareerPageUseCase(repo: careerPageRemoteRepo)
        careerPageRemoteRepo.useCase = careerPageUseCase
        
        let careerPageViewModel = CareerPageViewModel(useCase: careerPageUseCase)
        careerPageViewModel.view = view
        careerPageUseCase.viewModel = careerPageViewModel
        
        return careerPageViewModel
    }
}
