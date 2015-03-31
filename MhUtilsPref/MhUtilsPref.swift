//
//  MhUtilsPref.swift
//  mhUtils
//
//  Created by kevin.renous on 3/31/15.
//  Copyright (c) 2015 kevin.renous. All rights reserved.
//

import PreferencePanes

class MhUtilsPref:NSPreferencePane  {
    
    let domainName = "co.il.myheritage.MhUtils"
    var hosts :[Host]!
    
    @IBOutlet weak var tableHosts: NSTableColumn!
    
    override func mainViewDidLoad(){
        
         var preferences = NSUserDefaults.standardUserDefaults()
            .persistentDomainForName(domainName)
        
        if let hostsData = preferences?["hosts"] as? [NSData] {
            
            
            for (index, hostSerial) in enumerate(hostsData) {
                let host: Host! = NSKeyedUnarchiver.unarchiveObjectWithData(hostSerial as NSData) as? Host
                
                //push to hosts array
                hosts.append(host)
            }
        }
        
        
        
        
    }
}