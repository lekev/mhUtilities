//
//  MhMenu.swift
//  mhUtils
//
//  Created by kevin.renous on 3/29/15.
//  Copyright (c) 2015 kevin.renous. All rights reserved.
//

import Cocoa

class MhMenu: NSMenu {
    
    
    
    @IBOutlet  var stagingMenu: NSMenu!
    
    var hosts :[Host]!
    var currentHost :Host!
    

    func onClickHost(sender: NSMenuItem) -> Bool {
        
        let index = sender.tag
        let host: Host = hosts[index]
        
        
        let cmdString: String! = host.commandString()
        
        let eventResult = commandAsSudo(cmdString)
        
        // Check errorInfo
        if !eventResult
        {
            println("Error with cmd")
        }
        else
        {
            currentHost = host
        }
        return true
    }
    
    func commandAsSudo(cmd: String) -> Bool {
        var appleScript: NSAppleScript?
        let script = "do shell script \"/Volumes/mhdev/devutils/set-hosts.sh \(cmd) \" with administrator privileges"
        
        appleScript = NSAppleScript(source:script)
        
        if let scriptToPerform = appleScript {
            var possibleError: NSDictionary?
            let eventResult = scriptToPerform.executeAndReturnError(&possibleError)
            
            if let error = possibleError {
                
                let alert = NSAlert()
                alert.messageText = error["NSAppleScriptErrorMessage"]! as? String;
                alert.informativeText = "Maybe not in office or not using vpn"
                alert.runModal()
                println("ERROR: \(error)")
                return false
                
            }
            
        }
        return true
    }

    
    
    func refreshFromPreferences(){
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var hostsSerialArr: [AnyObject]! = defaults.arrayForKey("hosts")
        
        hosts = []
        for (index, hostSerial) in enumerate(hostsSerialArr) {
            let host: Host! = NSKeyedUnarchiver.unarchiveObjectWithData(hostSerial as NSData) as? Host
            var newItem = NSMenuItem()
            newItem.title = host.name
            newItem.action = Selector("onClickHost:")
            newItem.target = self
            newItem.enabled = true
            newItem.tag = index
            if host is Staging {
                stagingMenu.addItem(newItem)
            }else
            {
                self.addItem(newItem)
            }
            
            //push to hosts array
            hosts.append(host)
        }
        
        
    }


}