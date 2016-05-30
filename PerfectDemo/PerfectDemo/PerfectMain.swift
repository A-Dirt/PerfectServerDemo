//
//  PerfectMain.swift
//  PerfectDemo
//
//  Created by TywinZhang on 16/5/30.
//  Copyright © 2016年 AiLi.Technology Co. All rights reserved.
//

import Foundation

import PerfectLib

// This is the function which all Perfect Server modules must expose.
// The system will load the module and call this function.
// In here, register any handlers or perform any one-time tasks.
public func PerfectServerModuleInit() {
    
    // Install the built-in routing handler.
    // Using this system is optional and you could install your own system if desired.
    Routing.Handler.registerGlobally()
    
    Routing.Routes["GET", ["/", "index.html"] ] = { (_:WebResponse) in return IndexHandler() }
    
    // Check the console to see the logical structure of what was installed.
    print("\(Routing.Routes.description)")
}

class IndexHandler: RequestHandler {
    
    func handleRequest(request: WebRequest, response: WebResponse) {
        response.appendBodyString("Index handler: You accessed path \(request.requestURI())")
        response.requestCompletedCallback()
    }
}