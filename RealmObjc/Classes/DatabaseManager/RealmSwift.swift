//
//  RealmSwift.swift
//  DemoRealm
//
//  Created by Toof_Appsia on 2/27/17.
//  Copyright © 2017 Toof_Appsia. All rights reserved.
//

import Foundation
import RealmSwift

var realm: Realm! {
    var realm: Realm!
    do {
        realm = try Realm()
    }
    catch {
        let storePath = Realm.Configuration.defaultConfiguration.fileURL?.path
        do {
            try FileManager.default.removeItem(atPath: storePath!)
        }
        catch let error {
            print("ERROR: ... \(error)")
        }
    }
    return realm
}

extension Realm {
    func commitWriting() {
        do {
            try commitWrite()
        }
        catch let error {
            print("ERROR: ... \(error)")
        }
    }
}
