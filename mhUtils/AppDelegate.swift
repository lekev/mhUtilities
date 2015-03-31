//
//  AppDelegate.swift
//  mhUtils
//
//  Created by kevin.renous on 3/27/15.
//  Copyright (c) 2015 kevin.renous. All rights reserved.
//

import Cocoa


class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet  var statusMenu: MhMenu!
    
    var hostsArr :[Host]!
    
    var currentHost: Host!
    var statusItem: NSStatusItem!

    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
         // Register the preference defaults
        var appDefaults = [
            "hosts": [
                NSKeyedArchiver.archivedDataWithRootObject(Host(name: "localhost", type: "localhost")),
                NSKeyedArchiver.archivedDataWithRootObject(Host(name: "Production", type: "production")),
                NSKeyedArchiver.archivedDataWithRootObject(Staging(num: 133))
            ]
        ]
        
        NSUserDefaults.standardUserDefaults().registerDefaults(appDefaults)
       
        
        
        // make a status bar that has variable lenght
        // (as opposed to being a standard square size)
        // -1 to indication "variable length"
        
         statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
        
        // set the text that appears in the menu bar
        statusItem.title = "MH"
        statusItem.length = 100
        statusItem.image = NSImage(named: "logonh")
        
        // set if the item should change color when clicked
        statusItem.highlightMode = true
        statusMenu.refreshFromPreferences()
        statusItem.menu = statusMenu
        
                
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    
}

