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

class Job: BaseModel {
    dynamic var position: String = ""
    let emploies: List<Employ> = List<Employ>()
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        position    <- map["position"]
    }
}
