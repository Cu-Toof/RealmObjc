//
//  ViewController.swift
//  RealmObjc
//
//  Created by toanf9dn@gmail.com on 04/13/2017.
//  Copyright (c) 2017 toanf9dn@gmail.com. All rights reserved.
//

import UIKit
import RealmObjc

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createObject()
        print("\(ReamlObject.fetchObject(Employ.self)?.jobs.first?.position)")
    }
    
    func createObject() {
        let employ = Employ()
        employ.name = "Toan"
        employ.age = 23
        ReamlObject.addObject(employ)
        
        let job = Job()
        job.position = "dev"
        job.emploies.append(employ)
        ReamlObject.addObject(job)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

