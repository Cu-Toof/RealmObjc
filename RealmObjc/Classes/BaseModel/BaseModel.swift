//
//  BaseModel.swift
//  DemoRealm
//
//  Created by Toof_Appsia on 2/27/17.
//  Copyright © 2017 Toof_Appsia. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import ObjectMapper

class BaseModel: Object, Mappable {
    dynamic var id = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    required init?(map: Map) {
        super.init()
    }
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    func mapping(map: Map) {
        id = UUID().uuidString
    }
    
}
