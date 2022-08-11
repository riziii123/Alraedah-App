// Created on 10/08/2022
// Copyright © 2022 Rizwan

import Foundation
import ObjectMapper
import RealmSwift

class ApplicationsModel: NSObject, Mappable {
    
    var applications: [ApplicationModel]
    
    override init() {
        applications = [ApplicationModel]()
    }
    
    required init?(map: ObjectMapper.Map) {
        applications = [ApplicationModel]()
    }
    
    func mapping(map: ObjectMapper.Map) {
        applications <- map["data"]
    }
}

class ApplicationModel: Object, Mappable {
    
    @Persisted var applicationId: Int
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var imageUrl: String
    @Persisted var occupation: String
    @Persisted var linkedinUrl: String
    @Persisted var resumeUrl: String
    @Persisted var dateApplied: String
    @Persisted var status: String
    @Persisted var score: String
    
    override init() {
        
    }
    
    required init?(map: ObjectMapper.Map) {
        
    }
        
    func mapping(map: ObjectMapper.Map) {
        applicationId <- map["id"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        imageUrl <- map["image_url"]
        occupation <- map["occupation"]
        linkedinUrl <- map["linkedin_url"]
        resumeUrl <- map["resume_url"]
        dateApplied <- map["date_applied"]
        status <- map["status"]
        score <- map["score"]
    }
    
}

