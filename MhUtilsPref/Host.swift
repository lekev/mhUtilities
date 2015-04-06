//
//  Host.swift
//  mhUtils
//
//  Created by kevin.renous on 3/28/15.
//  Copyright (c) 2015 kevin.renous. All rights reserved.
//

import Foundation
import Cocoa

class Host: NSObject, NSCoding {
    
    var name:String!
    var type:String!
    
    init(name: String, type: String){
        self.name = name
        self.type = type
        
    }
    
    
    required init(coder aDecoder: NSCoder)  {
        
        self.name = aDecoder.decodeObjectForKey("name") as? String
        self.type = aDecoder.decodeObjectForKey("type") as? String
    }
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey:"name")
        aCoder.encodeObject(type, forKey:"type")
        
    }
    
    func commandString()->String?
    {
        return type
    }
    
}