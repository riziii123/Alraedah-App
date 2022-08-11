// Created on 10/08/2022
// Copyright © 2022 Rizwan

import Foundation

protocol ViewToViewModelContract: AnyObject {
    func loadData()
}

protocol ViewModelToViewContract: AnyObject {
    func loadDataSuccess(items: [ApplicationModel])
    func loadDataFailure()
}

protocol ViewModelToUseCaseContract: AnyObject {
    func fetchData()
}

protocol UseCaseToViewModelContract: AnyObject {
    func fetchDataSuccess(items: [ApplicationModel])
    func fetchDataFailure(error: String)
}

protocol UseCaseToRemoteRepoContract: AnyObject {
    func fetchRemoteData()
}

protocol UseCaseToLocalRepoContract: AnyObject {
    func fetchLocalData()
    func saveData(items: [ApplicationModel])
}

protocol RemoteRepoToUseCaseContract: AnyObject {
    func fetchRemoteDataSuccess(items: [ApplicationModel])
    func fetchRemoteDataFailure(error: String)
}

protocol LocalRepoToUseCaseContract: AnyObject {
    func fetchLocalDataSuccess(items: [ApplicationModel])
    func fetchLocalDataFailure(error: String)
}

protocol AdminPanelFactoryContract: AnyObject {
    func createAdminPanelViewModel(view: ViewModelToViewContract) throws -> AdminPanelViewModel
}

protocol AdminPanelCellToViewControllerProtocol {
    func updateStatusTapped()
    func deleteTapped(index: Int)
    func editTapped(index: Int)
}
