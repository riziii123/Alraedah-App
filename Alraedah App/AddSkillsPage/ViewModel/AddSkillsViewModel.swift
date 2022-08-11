// Created on 11/08/2022
// Copyright © 2022 Rizwan

import Foundation

class AddSkillsViewModel {
    
    var skillsArray: Array<String> = ["Obj-C", "Web Java", "Web PHP", "Java Script", "HTML", "Ruby", "Scrum Master", "Web Python", "C/C++", "Others"]
    
    init() {
        
    }
    
    func getSkillsArray(isFiltered: Bool = false) -> Array<String> {
        if isFiltered {
            var filteredArray = skillsArray.filter({ $0.hasPrefix("Web") })
            filteredArray.append("Others")
            return filteredArray
        }
        
        return skillsArray
    }
    
    func appendSkillToArray(skill: String) -> Array<String> {
        skillsArray.insert(skill, at: skillsArray.count - 1)
        return skillsArray
    }
}
