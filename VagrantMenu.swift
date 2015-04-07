//
//  VagrantMenu.swift
//  mhUtils
//
//  Created by kevin.renous on 4/6/15.
//  Copyright (c) 2015 kevin.renous. All rights reserved.
//

import Foundation

class VagrantMenu: NSMenuItem {
    
    
     override init() {
        super.init()
        
        var task: NSTask = Utils.runCommandWithArguments("/usr/bin/vagrant", arguments: ["status"])
        
        let fileOutput: NSFileHandle = task.standardOutput.fileHandleForReading
        let dataOutput: NSData = fileOutput.readDataToEndOfFile()
        let stringOutput: NSString? = NSString(data: dataOutput, encoding: NSUTF8StringEncoding)
    }

     required init(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    
    
    
    func ParseVagrantStatus(stringOutput: String) -> NSArray
    {
        var status: NSMutableArray = []
        
        let lines = stringOutput.componentsSeparatedByString("\n")
    }
    
//    - (NSArray *) parseGlobalStatus:(NSString *)stringOutput {
//    
//    NSMutableArray * status = [@[] mutableCopy];
//    
//    NSArray * lines = [stringOutput componentsSeparatedByString:@"\n"];
//    BOOL listingMachines = NO;
//    for ( NSString * line in lines ) {
//    if ( [line length] > 4 && [[line substringToIndex:5] isEqualToString:@"-----"] ) {
//    listingMachines = YES;
//    continue;
//    }
//    if ( listingMachines ) {
//    NSArray * tokens = [line componentsSeparatedByString:@" "];
//    NSMutableArray * validTokens = [@[] mutableCopy];
//    for ( NSString * token in tokens ) {
//    if ( [[token stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] > 0 ) {
//    [validTokens addObject:token];
//    }
//    }
//    if ( [validTokens count] >= 5 ) {
//    if ( [[tokens objectAtIndex:5] characterAtIndex:0] != '/' ) {
//    continue;
//    }
//    NSArray *paths = [validTokens subarrayWithRange:NSMakeRange(4, [validTokens count] - 4)];
//    NSString *path = [paths componentsJoinedByString:@" "];
//    
//    [status addObject:@{
//    @"id" : validTokens[ 0 ],
//    @"name" : validTokens[ 1 ],
//    @"provider" : validTokens[ 2 ],
//    @"state" : validTokens[ 3 ],
//    @"path" : path
//    }];
//    
//}
//else {
//    break;
//}
//}
//}
//return status;
//
//}


}