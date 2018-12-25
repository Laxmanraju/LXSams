//
//  LXIssueCommentCell.swift
//  LXSamsProject
//
//  Created by laxman penmetsa on 12/16/18.
//  Copyright © 2018 com.laxman. All rights reserved.
//

import UIKit
import Down
class LXIssueCommentCell: UITableViewCell {
    
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func populateCellForComment(_ comment: LXGitIssue) {
        self.loadingIndicator.stopAnimating()
        self.nameLabel.text = comment.user?.login
        self.nameLabel.font = UIFont.LXMedium(size: LXIssueNumericConstants.subTitleFontSize)
        
        let bodyAttributedString = NSMutableAttributedString()
        if let bodyString = LXDownWrapper.getRenderedMarkDownToString(markdownText: comment.body ?? String.emptyString){
            bodyAttributedString.book(bodyString, size: LXIssueNumericConstants.bodyFontSize)
        }else{
            bodyAttributedString.book("// READ ERROR // \n \(comment.body ?? String.emptyString)", size: LXIssueNumericConstants.bodyFontSize)
        }
        self.descriptionLabel.attributedText = bodyAttributedString
        
        self.avatarImageView.downloadImageFromLink(link: comment.user?.avatarUrl ?? String.emptyString)
        if let commentedDate = comment.createdAt, !commentedDate.isEmpty{
            let duration = getDurationStringSinceCreatedDate(commentedDate)
            self.periodLabel.text = String.init(format: LXIssueConstants.commentedDuration, duration)
            self.periodLabel.textColor = UIColor.LXGrey()
            self.periodLabel.font = UIFont.LXBook(size:  LXIssueNumericConstants.subTitleFontSize)
            
            
        }
    }
}
