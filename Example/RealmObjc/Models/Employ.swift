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

class Employ: Object, Mappable {
    dynamic var id = ""
    dynamic var name: String = ""
    dynamic var age: Int = 0
    var jobs = LinkingObjects(fromType: Job.self, property: "emploies")
    
    override open class func primaryKey() -> String? {
        return "id"
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id = UUID().uuidString
        name    <- map["name"]
        age     <- map["age"]
    }
    
}
