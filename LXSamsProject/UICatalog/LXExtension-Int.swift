//
//  LXExtension-Int.swift
//  LXSamsProject
//
//  Created by laxman penmetsa on 12/17/18.
//  Copyright © 2018 com.laxman. All rights reserved.
//

import Foundation

public extension Int {
    public func convertedToDuration() -> String{
        var durationString = String.emptyString
        if self < 7{
            durationString = "\(self) days"
        }else if self > 7, self<30{
            let weeks = abs(self/7)
            durationString = "\(weeks) weeks"
        }else if self > 30 , self < 365{
            let months = abs(self/30)
            durationString = "\(months) months"
        }else {
            let years = abs(self/365)
            durationString = "\(years) years"
        }
        return durationString
    }
    
}
