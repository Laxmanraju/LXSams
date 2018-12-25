//
//  LXIssueInfoCell.swift
//  LXSamsProject
//
//  Created by laxman penmetsa on 12/16/18.
//  Copyright © 2018 com.laxman. All rights reserved.
//

import UIKit
import  Down

class LXIssueInfoCell: UITableViewCell {
    
    
    @IBOutlet weak var authorAvatarImageView: UIImageView!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var issueBodyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func configureUI() {
        self.isUserInteractionEnabled = false
        statusView.layer.cornerRadius = 3
    }
    
    func populateInfoCellForIssue(_ issue: LXGitIssue)  {
        let bodyAttributedString = NSMutableAttributedString()
        if let bodyString = LXDownWrapper.getRenderedMarkDownToString(markdownText: issue.body ?? String.emptyString){
            bodyAttributedString.book(bodyString, size: LXIssueNumericConstants.bodyFontSize)
        }else{
            bodyAttributedString.book("// READ ERROR // \n \(issue.body ?? String.emptyString)", size:  LXIssueNumericConstants.bodyFontSize)
        }
        self.issueBodyLabel.attributedText = bodyAttributedString
        self.titleLabel.text = issue.title
        self.titleLabel.font = UIFont.LXBold(size: LXIssueNumericConstants.headingFontSize)
        self.authorAvatarImageView.downloadImageFromLink(link: issue.user?.avatarUrl ?? String.emptyString)
        self.activityLabel.attributedText = self.getAttributedTextForActivityLabelForIsssue(issue)
    }
    
    private func getAttributedTextForActivityLabelForIsssue(_ issue: LXGitIssue) -> NSMutableAttributedString {
        let combination = NSMutableAttributedString()
        combination.bold(issue.user?.login ?? String.emptyString, size:  LXIssueNumericConstants.subTitleFontSize)
        combination.book(String.whiteSpace, size:  LXIssueNumericConstants.subTitleFontSize)
        if let createdDate = issue.createdAt, !createdDate.isEmpty{
            let duration = getDurationStringSinceCreatedDate(createdDate)
            combination.book(String.init(format: LXIssueConstants.openedDuration, duration), size:  LXIssueNumericConstants.subTitleFontSize, color: .LXGrey())
        }
        combination.book( ", ", size:  LXIssueNumericConstants.subTitleFontSize)
        if let updatedDate = issue.updatedAt, !updatedDate.isEmpty{
            let duration = getDurationStringSinceCreatedDate(updatedDate)
            combination.book(String.init(format: LXIssueConstants.editedDuration, duration), size:  LXIssueNumericConstants.subTitleFontSize, color: .LXGrey())
        }
        return combination
    }
}

