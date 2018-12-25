//
//  LXUtilities.swift
//  LXSamsProject
//
//  Created by laxman penmetsa on 12/17/18.
//  Copyright © 2018 com.laxman. All rights reserved.
//

import Foundation

func parseDateFromResponseString(dateString: String, withTime : Bool) -> String {
    var dateStr = dateString
    if dateStr.contains("T") {
        dateStr = dateStr.components(separatedBy: "T").first!
    }
    return dateStr
}

func getNumberOfDaysPastSinceDate(_ date: String) -> Int {
    let createdDateString = date
    let currentDateString = Date.getLocalDateAsString()
    let currentDate = currentDateString.toISO8601DateTime(dateFormat: "yyyy-MM-dd") ??  Date()
    let createdDate = createdDateString.toISO8601DateTime(dateFormat: "yyyy-MM-dd") ?? Date()
    return createdDate.daysBetweenDate(toDate: currentDate)
}


func getDurationStringSinceCreatedDate(_ createdDate: String, withTime: Bool = false) -> String {
    let created = parseDateFromResponseString(dateString: createdDate, withTime: withTime)
    let daysPast = getNumberOfDaysPastSinceDate(created)
    let duration = daysPast.convertedToDuration()
    return duration
}
