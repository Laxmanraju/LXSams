//
//  LXIssueRequestHandler.swift
//  LXSamsProject
//
//  Created by laxman penmetsa on 12/16/18.
//  Copyright © 2018 com.laxman. All rights reserved.
//

import Foundation

open class LXIssueRequestHandler: NSObject {
    public typealias ResponseHandler = (_ responseData: Data?, _ headerResponse: URLResponse?, _ error:Error?) -> ()
    
    func getDataFromURL(_ url:URL, completionHandler: @escaping ResponseHandler){
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            completionHandler(data, response, error)
        }
        task.resume()
    }
    
}

