//
//  DatabaseManager.swift
//  DemoRealm
//
//  Created by Toof_Appsia on 2/27/17.
//  Copyright © 2017 Toof_Appsia. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

public final class DatabaseManager {
    
    open static var shareInstance = DatabaseManager()
    
    //  MARK: fetch object
    
    open func fetchObject<T: Object>(_ type: T.Type) -> T? {
        let results: Results<T> = realm.objects(type)
        if results.count > 0 {
            return results.first
        }
        return nil
    }
    
    open func fetchObject<T: Object>(_ type: T.Type, filter predicate: NSPredicate) -> T? {
        let results: Results<T> = realm.objects(type).filter(predicate)
        if results.count > 0 {
            return results.first
        }
        return nil
    }
    
    //  MARK: fetch objects -> Result<T>
    
    open func fetchObjects<T: Object>(_ type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
    
    open func fetchObjects<T: Object>(_ type: T.Type, filter predicate: NSPredicate) -> Results<T> {
        return realm.objects(type).filter(predicate)
    }
    
    open func fetchObjects<T: Object>(_ type: T.Type, sortBy propertiesSort: [String: Bool]?) -> Results<T> {
        var results = realm.objects(type)
        for property in propertiesSort! {
            results = results.sorted(byKeyPath: property.0, ascending: property.1)
        }
        return results
    }
    
    open func fetchObjects<T: Object>(_ type: T.Type, filter predicate: NSPredicate, sortBy propertiesSort: [String: Bool]?) -> Results<T> {
        var results = realm.objects(type).filter(predicate)
        for property in propertiesSort! {
            results = results.sorted(byKeyPath: property.0, ascending: property.1)
        }
        return results
    }
    
    //  MARK: fetch objects -> List<T>
    
    open func fetchListObjects<T: Object>(_ type: T.Type) -> List<T> {
        let results = realm.objects(type)
        return results.reduce(List<T>()) { (list, element) -> List<T> in
            list.append(element)
            return list
        }
    }
    
    open func fetchListObjects<T: Object>(_ type: T.Type, filter predicate: NSPredicate) -> List<T> {
        let results = realm.objects(type).filter(predicate)
        return results.reduce(List<T>()) { (list, element) -> List<T> in
            list.append(element)
            return list
        }
    }
    
    open func fetchListObjects<T: Object>(_ type: T.Type, sortBy propertiesSort: [String: Bool]?) -> List<T> {
        var results = realm.objects(type)
        for property in propertiesSort! {
            results = results.sorted(byKeyPath: property.0, ascending: property.1)
        }
        return results.reduce(List<T>()) { (list, element) -> List<T> in
            list.append(element)
            return list
        }
    }
    
    open func fetchListObjects<T: Object>(_ type: T.Type, filter predicate: NSPredicate, sortBy propertiesSort: [String: Bool]?) -> List<T> {
        var results = realm.objects(type).filter(predicate)
        for property in propertiesSort! {
            results = results.sorted(byKeyPath: property.0, ascending: property.1)
        }
        return results.reduce(List<T>()) { (list, element) -> List<T> in
            list.append(element)
            return list
        }
    }
    
    //  MARK: add object
    
    open func addObject<T: Object>(_ object: T) -> Void {
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
    
    open func deleteObject<T: Object>(_ object: T) -> Void {
        realm.beginWrite()
        realm.delete(object)
        realm.commitWriting()
    }
    
}
