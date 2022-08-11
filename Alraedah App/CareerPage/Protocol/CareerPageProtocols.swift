// Created on 11/08/2022
// Copyright © 2022 Talabat

import Foundation

protocol CareerPageViewToViewModelContract: AnyObject {
    func loadData()
}

protocol CareerPageViewModelToViewContract: AnyObject {
    func loadDataSuccess(application: CareerApplication)
    func loadDataFailure()
}

protocol CareerPageViewModelToUseCaseContract: AnyObject {
    func fetchData()
}

protocol CareerPageUseCaseToViewModelContract: AnyObject {
    func fetchDataSuccess(application: CareerApplication)
    func fetchDataFailure(error: String)
}

protocol CareerPageUseCaseToRemoteRepoContract: AnyObject {
    func fetchRemoteData()
}

protocol CareerPageRemoteRepoToUseCaseContract: AnyObject {
    func fetchRemoteDataSuccess(application: CareerApplication)
    func fetchRemoteDataFailure(error: String)
}
