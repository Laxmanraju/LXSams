//
//  ViewController.swift
//  LXSamsProject
//
//  Created by laxman penmetsa on 12/11/18.
//  Copyright © 2018 com.laxman. All rights reserved.
//

import UIKit
import SwiftyJSON

enum LXIssueType: Int {
    case ALL
    case OPEN
    case CLOSED
}

class LXIssuesViewController: UIViewController {
    
    var gitIssues: [LXGitIssue]?
    var dataSourceArray: [LXGitIssue]?
    @IBOutlet weak var issuesTableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    var selectedIssueFilter: LXIssueType = .ALL
    let requestHandler = LXIssueRequestHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        registerCells()
        issuesTableView.delegate = self
        issuesTableView.dataSource = self
        fetchIssuesList()
        
    }
    
    func registerCells() {
        /*  the below commented code crashes the app for reason -- It will overwrite the storyboard and as a result, the outlet links in the storyboard are ignored, as the result the @IBOutlets in the LXIssueTableViewCell are made nil. It works for classes without .xib file */
        //      tableView.register(LXIssueTableViewCell.self, forCellReuseIdentifier: LXIssueConstants.issueCell)
        issuesTableView.register(UINib(nibName: LXIssueConstants.issueCellID, bundle: nil), forCellReuseIdentifier: LXIssueConstants.issueCellID)
    }
    
    func configureUI() {
        issuesTableView.rowHeight = UITableView.automaticDimension
        issuesTableView.estimatedRowHeight = 100
        let font = UIFont.LXBold(size: LXIssueNumericConstants.bodyFontSize)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font],
                                                for: .normal)
        self.title = LXIssueConstants.issuesTitle
    }
    
    func showInfoAlertWithText(_ text: String) {
        let alert = UIAlertController(title: LXIssueConstants.alert, message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: LXIssueConstants.click, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func segmentIndexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            dataSourceArray = gitIssues
        case 1:
            dataSourceArray = gitIssues?.filter{$0.state == LXIssueConstants.open}
        case 2:
            dataSourceArray = gitIssues?.filter{$0.state == LXIssueConstants.closed}
        default:
            break
        }
        self.issuesTableView.reloadData()
    }
    
    func fetchIssuesList()  {
        if let URL = NSURL(string: LXIssueConstants.thoraxApiURL){
            requestHandler.getDataFromURL(URL as URL) { (data, urlResponse, error) in
                guard let data = data else {
                    let errorDescription = error?.localizedDescription ?? LXIssueConstants.errorDownloadData
                    DispatchQueue.main.async {
                        self.showInfoAlertWithText(errorDescription)
                    }
                    return
                }
                do {
                    if let jsonArray = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSMutableArray{
                        for each in jsonArray {
                            guard let issue = each as? [String:Any] else { continue }
                            let issueJson = JSON.init(issue)
                            let gitIssue = LXGitIssue.init(json: issueJson)
                            if (self.gitIssues?.append(gitIssue)) == nil {
                                self.gitIssues = [gitIssue]
                            }
                        }
                        if self.dataSourceArray == nil{
                            self.dataSourceArray = self.gitIssues
                        }
                        DispatchQueue.main.async {
                            self.loadingIndicator.stopAnimating()
                            self.issuesTableView.reloadData()
                        }
                    }
                }catch{
                    print(LXIssueConstants.errorDataFormat)
                }
            }
        }
    }
}

extension LXIssuesViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailViewController = UIStoryboard.init(name: LXIssueConstants.storyBoardMain, bundle: nil).instantiateViewController(withIdentifier: LXIssueConstants.LXIssuesDetailViewController) as? LXIssuesDetailViewController{
            if let selected = self.gitIssues?[indexPath.row]{
                detailViewController.selectedIssue = selected
            }
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension LXIssuesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LXIssueConstants.issueCellID, for: indexPath) as! LXIssueTableViewCell
        if let issue = dataSourceArray?[indexPath.row]{
            cell.populateCellForIssue(issue)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard  let count = dataSourceArray?.count  else {
            return 0
        }
        if count == 0{
            showInfoAlertWithText(LXIssueConstants.noIssuesFound)
        }
        return dataSourceArray?.count ?? 0
    }
}
