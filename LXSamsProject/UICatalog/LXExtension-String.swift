//
//  LXExtension-String.swift
//  LXSamsProject
//
//  Created by laxman penmetsa on 12/17/18.
//  Copyright © 2018 com.laxman. All rights reserved.
//

import Foundation

public extension String {
    static var emptyString : String {
        get {
            return ""
        }
    }
    static var whiteSpace : String {
        get {
            return " "
        }
    }
    public func toISO8601DateTime(dateFormat: String? = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX") -> Date?
    {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = dateFormat
        let date : Date? = formatter.date(from: self)
        return date
    }
}

