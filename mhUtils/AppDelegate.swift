//
//  AppDelegate.swift
//  mhUtils
//
//  Created by kevin.renous on 3/27/15.
//  Copyright (c) 2015 kevin.renous. All rights reserved.
//

import Cocoa


struct global {
    // make a status bar that has variable lenght
    // (as opposed to being a standard square size)
    // -1 to indication "variable length"
    static let statusItem: NSStatusItem =  NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    
}

class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet  var statusMenu: MhMenu!

    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        // Register the preference defaults
        let localhost = Host(name: "Localhost", type: "localhost")
        let production = Host(name: "Production", type: "production")
        
        let hosts = [production, localhost]
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(NSKeyedArchiver.archivedDataWithRootObject(hosts), forKey: "hosts")
        
        // Define StatusItem
        
        // set the text that appears in the menu bar
        global.statusItem.title = "MH"
        global.statusItem.length = 100
        global.statusItem.image = NSImage(named: "logonh")
        // set if the item should change color when clicked
        global.statusItem.highlightMode = true
        global.statusItem.menu = statusMenu
        
        // Construct Host menu from user preference.
        statusMenu.refreshFromPreferences()
        
        
    }
    
    
    
    func applicationWillTerminate(aNotification: NSNotification) {
        
    }
    
}



