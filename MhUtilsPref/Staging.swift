//
//  Staging.swift
//  mhUtils
//
//  Created by kevin.renous on 3/28/15.
//  Copyright (c) 2015 kevin.renous. All rights reserved.
//

import Foundation

class Staging: Host {
   
    init(num: Int){
        
        let nameOver = "stgweb\(num)"
        super.init(name: nameOver, type: "staging")
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
}