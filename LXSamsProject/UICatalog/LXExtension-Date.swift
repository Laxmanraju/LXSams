//
//  LXExtension-Date.swift
//  LXSamsProject
//
//  Created by laxman penmetsa on 12/17/18.
//  Copyright © 2018 com.laxman. All rights reserved.
//

import Foundation

public extension Date{
    static func getLocalDateAsString() -> String{
        let utcdate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone  =  TimeZone.ReferenceType.default
        let loacalDate = dateFormatter.string(from: utcdate as Date)
        return loacalDate
    }
    
    public func daysBetweenDate(toDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.day], from: self, to: toDate)
        return components.day ?? 0
    }
}

