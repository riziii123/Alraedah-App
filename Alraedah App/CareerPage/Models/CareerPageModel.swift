// Created on 11/08/2022
// Copyright © 2022 Rizwan

import Foundation
import ObjectMapper

class CareerPageModel: NSObject, Mappable {
    
    var application: CareerApplication?
    
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        application <- map["data"]
    }
}

class CareerApplication: Mappable {
    
    var applicationId: Int
    var firstName: String
    var lastName: String
    var imageUrl: String
    var occupation: String
    var linkedinUrl: String
    var resumeUrl: String
    var dateApplied: String
    var status: String
    var score: String
    var skills: [String]
    
    required init?(map: ObjectMapper.Map) {
        applicationId = 0
        firstName = ""
        lastName = ""
        imageUrl = ""
        occupation = ""
        linkedinUrl = ""
        resumeUrl = ""
        dateApplied = ""
        status = ""
        score = ""
        skills = [String]()
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
        skills <- map["skills"]
    }
    
}

