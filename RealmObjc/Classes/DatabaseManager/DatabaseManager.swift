//
//  DatabaseManager.swift
//  DemoRealm
//
//  Created by Toof_Appsia on 2/27/17.
//  Copyright © 2017 Toof_Appsia. All rights reserved.
//

import Foundation
import RealmSwift

public final class DatabaseManager {
    
    open static var shareInstance = DatabaseManager()
    
    //  MARK: fetch object
    
    open func fetchObject<T: BaseModel>(_ type: T.Type) -> T? {
        let results: Results<T> = realm.objects(type)
        if results.count > 0 {
            return results.first
        }
        return nil
    }
    
    open func fetchObject<T: BaseModel>(_ type: T.Type, filter predicate: NSPredicate) -> T? {
        let results: Results<T> = realm.objects(type).filter(predicate)
        if results.count > 0 {
            return results.first
        }
        return nil
    }
    
    //  MARK: fetch objects
    
    open func fetchObjects<T: BaseModel>(_ type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
    
    
    open func fetchObjects<T: BaseModel>(_ type: T.Type, filter predicate: NSPredicate) -> Results<T> {
        return realm.objects(type).filter(predicate)
    }
    
    open func fetchObjects<T: BaseModel>(_ type: T.Type, sortBy propertiesSort: [String: Bool]?) -> Results<T> {
        var results = realm.objects(type)
        for property in propertiesSort! {
            results = results.sorted(byKeyPath: property.0, ascending: property.1)
        }
        return results
    }
    
    open func fetchObjects<T: BaseModel>(_ type: T.Type, filter predicate: NSPredicate, sortBy propertiesSort: [String: Bool]?) -> Results<T> {
        var results = realm.objects(type).filter(predicate)
        for property in propertiesSort! {
            results = results.sorted(byKeyPath: property.0, ascending: property.1)
        }
        return results
    }
    
    //  MARK: add object
    
    open func addObject<T: BaseModel>(_ object: T) -> Void {
        realm.beginWrite()
        realm.add(object, update: true)
        realm.commitWriting()
    }
    
    //  MARK: update object
    
    open func updateObject(_ block:() -> ()) -> Void {
        try! realm.write {
            block()
        }
    }
    
    //  MARK: remove object
    
    open func deleteObject<T: BaseModel>(_ object: T) -> Void {
        realm.beginWrite()
        realm.delete(object)
        realm.commitWriting()
    }
    
    open func fetchBaseModel() -> BaseModel {
        return realm.objects(BaseModel.self).first!
    }
    
    open func realmPath() -> String {
        return Realm.Configuration.defaultConfiguration.fileURL!.path
    }
    
}
