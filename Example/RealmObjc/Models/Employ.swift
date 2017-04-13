//
//  Employ.swift
//  DemoRealm
//
//  Created by Toof_Appsia on 2/27/17.
//  Copyright © 2017 Toof_Appsia. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import RealmObjc

class Employ: BaseModel {
    dynamic var name: String = ""
    dynamic var age: Int = 0
    var jobs = LinkingObjects(fromType: Job.self, property: "emploies")
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        name    <- map["name"]
        age     <- map["age"]
    }
    
}
