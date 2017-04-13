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
    
    public static var shareInstance = DatabaseManager()
    
    //  MARK: fetch object
    
    public func fetchObject<T: BaseModel>(_ type: T.Type) -> T? {
        let results: Results<T> = realm.objects(type)
        if results.count > 0 {
            return results.first
        }
        return nil
    }
    
    public func fetchObject<T: BaseModel>(_ type: T.Type, filter predicate: NSPredicate) -> T? {
        let results: Results<T> = realm.objects(type).filter(predicate)
        if results.count > 0 {
            return results.first
        }
        return nil
    }
    
    //  MARK: fetch objects
    
    public func fetchObjects<T: BaseModel>(_ type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
    
    
    public func fetchObjects<T: BaseModel>(_ type: T.Type, filter predicate: NSPredicate) -> Results<T> {
        return realm.objects(type).filter(predicate)
    }
    
    public func fetchObjects<T: BaseModel>(_ type: T.Type, sortBy propertiesSort: [String: Bool]?) -> Results<T> {
        var results = realm.objects(type)
        for property in propertiesSort! {
            results = results.sorted(byKeyPath: property.0, ascending: property.1)
        }
        return results
    }
    
    public func fetchObjects<T: BaseModel>(_ type: T.Type, filter predicate: NSPredicate, sortBy propertiesSort: [String: Bool]?) -> Results<T> {
        var results = realm.objects(type).filter(predicate)
        for property in propertiesSort! {
            results = results.sorted(byKeyPath: property.0, ascending: property.1)
        }
        return results
    }
    
    //  MARK: add object
    
    public func addObject<T: BaseModel>(_ object: T) -> Void {
        realm.beginWrite()
        realm.add(object, update: true)
        realm.commitWriting()
    }
    
    //  MARK: update object
    
    public func updateObject(_ block:() -> ()) -> Void {
        try! realm.write {
            block()
        }
    }
    
    //  MARK: remove object
    
    public func deleteObject<T: BaseModel>(_ object: T) -> Void {
        realm.beginWrite()
        realm.delete(object)
        realm.commitWriting()
    }
    
    public func fetchBaseModel() -> BaseModel {
        return realm.objects(BaseModel.self).first!
    }
    
}
