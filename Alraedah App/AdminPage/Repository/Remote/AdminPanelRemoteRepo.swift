// Created on 10/08/2022
// Copyright © 2022 Rizwan

import Foundation
import Alamofire
import ObjectMapper

class AdminPanelRemoteRepo: UseCaseToRemoteRepoContract {
    
    var applicationsUrl = "https://riziii123.github.io/responses/applications.json"
    weak var useCase: RemoteRepoToUseCaseContract?
    
    func fetchRemoteData() {
        AF.request(applicationsUrl).validate().responseJSON { response in
            switch response.result {
            case .success(let result):
                if let applicationData = Mapper<ApplicationsModel>().map(JSONObject: result) {
                    self.useCase?.fetchRemoteDataSuccess(items: applicationData.applications)
                } else {
                    // Return proper error message
                    self.useCase?.fetchRemoteDataFailure(error: "Error occured")
                }
                
            case .failure(let error):
                self.useCase?.fetchRemoteDataFailure(error: error.localizedDescription)
                
            }
        }
    }
}
