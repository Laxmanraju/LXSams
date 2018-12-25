//
//  LXIssueConstants.swift
//  LXSamsProject
//
//  Created by laxman penmetsa on 12/15/18.
//  Copyright © 2018 com.laxman. All rights reserved.
//

import Foundation
import UIKit
public class LXIssueConstants: NSObject {
    public static let thoraxApiURL                      = "https://api.github.com/repos/walmartlabs/thorax/issues"
    public static let storyBoardMain                    = "Main"
    public static let LXIssuesDetailViewController      = "LXIssuesDetailViewController"
    public static let issueCellID                       = "LXIssueTableViewCell"
    public static let issueInfoCellID                   = "LXIssueInfoCell"
    public static let issueCommentCellID                = "LXIssueCommentCell"
    public static let issuesTitle                       = "ISSUES"
    public static let alert                             = "Alert"
    public static let click                             = "OK"
    public static let open                              = "open"
    public static let closed                            = "closed"
    public static let errorDownloadData                 = "ERROR: Unable to Download data"
    public static let errorDataFormat                   = "ERROR: Corrupted data format"
    public static let noIssuesFound                     = "No Issues of this type found"
    public static let commentedDuration                 = "commented %@ ago"
    public static let openedDuration                    = "opened this issue %@ ago"
    public static let editedDuration                    = "edited %@ ago"
    public static let openedByAndDuration               = "Opened by %@ %@ ago"
}

public class LXIssueNumericConstants: NSObject {
    public static let headingFontSize: CGFloat                  = 22.0
    public static let bodyFontSize: CGFloat                     = 18.0
    public static let subTitleFontSize: CGFloat                 = 14.0
}
