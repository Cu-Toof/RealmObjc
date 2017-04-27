//
//  Job.swift
//  DemoRealm
//
//  Created by Toof_Appsia on 2/28/17.
//  Copyright © 2017 Toof_Appsia. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import RealmObjc

class Job: Object, Mappable {
    dynamic var id = ""
    dynamic var position: String = ""
    let emploies: List<Employ> = List<Employ>()
    
    override open class func primaryKey() -> String? {
        return "id"
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id = UUID().uuidString
        position    <- map["position"]
    }
}
