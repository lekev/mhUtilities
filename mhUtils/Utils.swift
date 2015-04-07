//
//  Utils.swift
//  mhUtils
//
//  Created by kevin.renous on 4/6/15.
//  Copyright (c) 2015 kevin.renous. All rights reserved.
//

import Foundation

class Utils {
      class func runCommandWithArguments(cmd: String ,arguments:[String]) -> NSTask {
    
        
        
        let task = NSTask()
        task.launchPath = cmd
        task.currentDirectoryPath = "/Volumes/mhdev/LocalEnv/"
        task.arguments = arguments
        
        let pipe = NSPipe()
        task.standardOutput = pipe
        task.launch()
        
        
    return task;
    
    }
}