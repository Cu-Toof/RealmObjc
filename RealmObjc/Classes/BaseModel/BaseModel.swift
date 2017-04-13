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

open class BaseModel: Object, Mappable {
    dynamic var id = ""
    
    override open class func primaryKey() -> String? {
        return "id"
    }
    
    required public init?(map: Map) {
        super.init()
    }
    
    required public init() {
        super.init()
    }
    
    required public init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required public init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    open func mapping(map: Map) {
        id = UUID().uuidString
    }
    
}
