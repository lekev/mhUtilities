//
//  MhUtilsPref.swift
//  mhUtils
//
//  Created by kevin.renous on 3/31/15.
//  Copyright (c) 2015 kevin.renous. All rights reserved.
//

import PreferencePanes

class MhUtilsPref:NSPreferencePane  {
    
    let domainName = "com.myheritage.MhUtils"
    var hosts :[Host]!
    
    @IBOutlet var textErr: NSTextView!
    @IBOutlet weak var tableHosts: NSTableColumn!
    
    override func mainViewDidLoad(){
        
        var preferences = NSUserDefaults.standardUserDefaults().persistentDomainForName(domainName) as? [String: AnyObject]
        
        if preferences == nil {
            preferences = [:]
        }
        
        NSKeyedUnarchiver.setClass(Host.self, forClassName: "Host")
        
        NSKeyedArchiver.setClassName("Host", forClass: Host.self)
        
        if let hostsArchived: AnyObject = preferences?["hosts"]  {
            hosts = NSKeyedUnarchiver.unarchiveObjectWithData(hostsArchived as NSData) as [Host]
        } else {
            hosts = []
        }
        
        
    }
}