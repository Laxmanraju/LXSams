//
//  LXIssuesDetailViewController.swift
//  LXSamsProject
//
//  Created by laxman penmetsa on 12/15/18.
//  Copyright © 2018 com.laxman. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

enum LXSectionType: Int{
    case INFO = 0
    case COMMENTS
}

class LXIssuesDetailViewController: UIViewController {
    @IBOutlet weak var detailTableView: UITableView!
    var requestHandler = LXIssueRequestHandler()
    public var selectedIssue : LXGitIssue?
    var commnetsCount = 0
    var commentsArray: [LXGitIssue]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.rowHeight = UITableView.automaticDimension
        detailTableView.estimatedRowHeight = 600
        detailTableView.delegate = self
        detailTableView.dataSource = self
        registerCells()
        configureData()
    }
    
    func registerCells() {
        detailTableView.register(UINib(nibName: LXIssueConstants.issueInfoCellID, bundle: nil), forCellReuseIdentifier: LXIssueConstants.issueInfoCellID)
        detailTableView.register(UINib(nibName: LXIssueConstants.issueCommentCellID, bundle: nil), forCellReuseIdentifier: LXIssueConstants.issueCommentCellID)
    }
    
    func configureData()  {
        if let count = selectedIssue?.comments{
            commnetsCount = count
        }
        if let commentsUrl = NSURL(string: selectedIssue?.commentsUrl ?? String.emptyString) as URL? {
            requestHandler.getDataFromURL(commentsUrl) { (data, response, error) in
                guard let data = data else {
                    let errorDescription = error?.localizedDescription ?? LXIssueConstants.errorDownloadData
                    self.showInfoAlertWithText(errorDescription)
                    return
                }
                do {
                    if let jsonArray = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSMutableArray{
                        for each in jsonArray {
                            guard let commentData = each as? [String:Any] else { continue }
                            let commentJson = JSON.init(commentData)
                            let comment = LXGitIssue.init(json: commentJson)
                            if (self.commentsArray?.append(comment)) == nil {
                                self.commentsArray = [comment]
                            }
                        }
                        DispatchQueue.main.async {
                            self.detailTableView.reloadData()
                        }
                    }
                }catch{
                    print(LXIssueConstants.errorDataFormat)
                }
            }
        }
    }
    
    func showInfoAlertWithText(_ text: String) {
        let alert = UIAlertController(title: LXIssueConstants.alert, message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: LXIssueConstants.click, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension LXIssuesDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case  LXSectionType.INFO.rawValue:
            return 1
        case  LXSectionType.COMMENTS.rawValue:
            return commnetsCount
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        switch section {
        case LXSectionType.INFO.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: LXIssueConstants.issueInfoCellID, for: indexPath) as! LXIssueInfoCell
            if let issue = selectedIssue{
                cell.populateInfoCellForIssue(issue)
            }
            return cell
        case LXSectionType.COMMENTS.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: LXIssueConstants.issueCommentCellID, for: indexPath) as! LXIssueCommentCell
            if let comment = commentsArray?[indexPath.row]{
                cell.populateCellForComment(comment)
            }
            return cell
        default:
            ()
        }
        return UITableViewCell()
    }
    
}

extension LXIssuesDetailViewController:UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        var sectionCount = 1
        if commnetsCount > 0{
            sectionCount += 1
        }
        return sectionCount
    }
}
