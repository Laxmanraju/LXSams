//
//  LXIssueTableViewCell.swift
//  LXSamsProject
//
//  Created by laxman penmetsa on 12/15/18.
//  Copyright © 2018 com.laxman. All rights reserved.
//

import UIKit

class LXIssueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var issueTitleLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func populateCellForIssue(_ issue: LXGitIssue)  {
        self.issueTitleLabel.sizeToFit()
        self.issueTitleLabel.text = issue.title
        self.issueTitleLabel.font = UIFont.LXMedium(size: LXIssueNumericConstants.bodyFontSize)
        self.issueTitleLabel.textColor = UIColor.LXBlue()
        
        if let createdDate = issue.createdAt, !createdDate.isEmpty{
            let duration = getDurationStringSinceCreatedDate(createdDate)
            if let creator = issue.user?.login{
                ageLabel.text =  String.init(format: LXIssueConstants.openedByAndDuration, creator, duration)
                ageLabel.textColor = UIColor.LXGrey()
                ageLabel.font = UIFont.LXBook(size:  LXIssueNumericConstants.subTitleFontSize)
            }else{
                ageLabel.isHidden = true 
            }
        }else{
            ageLabel.isHidden = true
        }
        
        if let number = issue.number{
            numberLabel.text = "#\(number)"
            numberLabel.textColor = UIColor.LXGrey()
            numberLabel.font = UIFont.LXBook(size: LXIssueNumericConstants.subTitleFontSize)
        }else{
            numberLabel.isHidden = true
        }
        
        
    }
    
}
