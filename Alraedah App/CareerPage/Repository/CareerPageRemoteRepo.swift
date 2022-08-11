// Created on 11/08/2022
// Copyright © 2022 Rizwan

import Foundation
import Alamofire
import ObjectMapper

class CareerPageRemoteRepo: CareerPageUseCaseToRemoteRepoContract {
    
    var applicationsUrl = "https://riziii123.github.io/responses/application.json"
    var useCase: CareerPageRemoteRepoToUseCaseContract?
    
    func fetchRemoteData() {
        AF.request(applicationsUrl).validate().responseJSON { response in
            switch response.result {
            case .success(let result):
                if let applicationData = Mapper<CareerPageModel>().map(JSONObject: result) {
                    if let application = applicationData.application {
                        self.useCase?.fetchRemoteDataSuccess(application: application)
                    }
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
