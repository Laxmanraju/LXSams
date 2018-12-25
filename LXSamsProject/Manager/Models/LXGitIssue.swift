//
//  LXGitIssue.swift
//
//  Created by Laxman Penmesta on 12/13/18
//  Copyright (c) com.laxman. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class LXGitIssue: NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let state = "state"
        static let labels = "labels"
        static let user = "user"
        static let updatedAt = "updated_at"
        static let htmlUrl = "html_url"
        static let issueUrl = "issue_url"
        static let body = "body"
        static let url = "url"
        static let locked = "locked"
        static let number = "number"
        static let authorAssociation = "author_association"
        static let assignees = "assignees"
        static let milestone = "milestone"
        static let labelsUrl = "labels_url"
        static let id = "id"
        static let pullRequest = "pull_request"
        static let createdAt = "created_at"
        static let comments = "comments"
        static let title = "title"
        static let commentsUrl = "comments_url"
        static let repositoryUrl = "repository_url"
        static let nodeId = "node_id"
        static let eventsUrl = "events_url"
    }
    
    // MARK: Properties
    public var state: String?
    public var labels: [LXLabels]?
    public var user: LXUser?
    public var updatedAt: String?
    public var htmlUrl: String?
    public var issueUrl: String?
    public var body: String?
    public var url: String?
    public var locked: Bool? = false
    public var number: Int?
    public var authorAssociation: String?
    public var assignees: [Any]?
    public var milestone: LXMilestone?
    public var labelsUrl: String?
    public var id: Int?
    public var pullRequest: LXPullRequest?
    public var createdAt: String?
    public var comments: Int?
    public var title: String?
    public var commentsUrl: String?
    public var repositoryUrl: String?
    public var nodeId: String?
    public var eventsUrl: String?
    
    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public required init(json: JSON) {
        state = json[SerializationKeys.state].string
        if let items = json[SerializationKeys.labels].array { labels = items.map { LXLabels(json: $0) } }
        user = LXUser(json: json[SerializationKeys.user])
        updatedAt = json[SerializationKeys.updatedAt].string
        htmlUrl = json[SerializationKeys.htmlUrl].string
        issueUrl = json[SerializationKeys.issueUrl].string
        body = json[SerializationKeys.body].string
        url = json[SerializationKeys.url].string
        locked = json[SerializationKeys.locked].boolValue
        number = json[SerializationKeys.number].int
        authorAssociation = json[SerializationKeys.authorAssociation].string
        if let items = json[SerializationKeys.assignees].array { assignees = items.map { $0.object} }
        milestone = LXMilestone(json: json[SerializationKeys.milestone])
        labelsUrl = json[SerializationKeys.labelsUrl].string
        id = json[SerializationKeys.id].int
        pullRequest = LXPullRequest(json: json[SerializationKeys.pullRequest])
        createdAt = json[SerializationKeys.createdAt].string
        comments = json[SerializationKeys.comments].int
        title = json[SerializationKeys.title].string
        commentsUrl = json[SerializationKeys.commentsUrl].string
        repositoryUrl = json[SerializationKeys.repositoryUrl].string
        nodeId = json[SerializationKeys.nodeId].string
        eventsUrl = json[SerializationKeys.eventsUrl].string
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = state { dictionary[SerializationKeys.state] = value }
        if let value = labels { dictionary[SerializationKeys.labels] = value.map { $0.dictionaryRepresentation() } }
        if let value = user { dictionary[SerializationKeys.user] = value.dictionaryRepresentation() }
        if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
        if let value = htmlUrl { dictionary[SerializationKeys.htmlUrl] = value }
        if let value = issueUrl { dictionary[SerializationKeys.issueUrl] = value }
        if let value = body { dictionary[SerializationKeys.body] = value }
        if let value = url { dictionary[SerializationKeys.url] = value }
        dictionary[SerializationKeys.locked] = locked
        if let value = number { dictionary[SerializationKeys.number] = value }
        if let value = authorAssociation { dictionary[SerializationKeys.authorAssociation] = value }
        if let value = assignees { dictionary[SerializationKeys.assignees] = value }
        if let value = milestone { dictionary[SerializationKeys.milestone] = value.dictionaryRepresentation() }
        if let value = labelsUrl { dictionary[SerializationKeys.labelsUrl] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = pullRequest { dictionary[SerializationKeys.pullRequest] = value.dictionaryRepresentation() }
        if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
        if let value = comments { dictionary[SerializationKeys.comments] = value }
        if let value = title { dictionary[SerializationKeys.title] = value }
        if let value = commentsUrl { dictionary[SerializationKeys.commentsUrl] = value }
        if let value = repositoryUrl { dictionary[SerializationKeys.repositoryUrl] = value }
        if let value = nodeId { dictionary[SerializationKeys.nodeId] = value }
        if let value = eventsUrl { dictionary[SerializationKeys.eventsUrl] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.state = aDecoder.decodeObject(forKey: SerializationKeys.state) as? String
        self.labels = aDecoder.decodeObject(forKey: SerializationKeys.labels) as? [LXLabels]
        self.user = aDecoder.decodeObject(forKey: SerializationKeys.user) as? LXUser
        self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
        self.htmlUrl = aDecoder.decodeObject(forKey: SerializationKeys.htmlUrl) as? String
        self.issueUrl = aDecoder.decodeObject(forKey: SerializationKeys.issueUrl) as? String
        self.body = aDecoder.decodeObject(forKey: SerializationKeys.body) as? String
        self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
        self.locked = aDecoder.decodeBool(forKey: SerializationKeys.locked)
        self.number = aDecoder.decodeObject(forKey: SerializationKeys.number) as? Int
        self.authorAssociation = aDecoder.decodeObject(forKey: SerializationKeys.authorAssociation) as? String
        self.assignees = aDecoder.decodeObject(forKey: SerializationKeys.assignees) as? [Any]
        self.milestone = aDecoder.decodeObject(forKey: SerializationKeys.milestone) as? LXMilestone
        self.labelsUrl = aDecoder.decodeObject(forKey: SerializationKeys.labelsUrl) as? String
        self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
        self.pullRequest = aDecoder.decodeObject(forKey: SerializationKeys.pullRequest) as? LXPullRequest
        self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
        self.comments = aDecoder.decodeObject(forKey: SerializationKeys.comments) as? Int
        self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
        self.commentsUrl = aDecoder.decodeObject(forKey: SerializationKeys.commentsUrl) as? String
        self.repositoryUrl = aDecoder.decodeObject(forKey: SerializationKeys.repositoryUrl) as? String
        self.nodeId = aDecoder.decodeObject(forKey: SerializationKeys.nodeId) as? String
        self.eventsUrl = aDecoder.decodeObject(forKey: SerializationKeys.eventsUrl) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(state, forKey: SerializationKeys.state)
        aCoder.encode(labels, forKey: SerializationKeys.labels)
        aCoder.encode(user, forKey: SerializationKeys.user)
        aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
        aCoder.encode(htmlUrl, forKey: SerializationKeys.htmlUrl)
        aCoder.encode(issueUrl, forKey: SerializationKeys.issueUrl)
        aCoder.encode(body, forKey: SerializationKeys.body)
        aCoder.encode(url, forKey: SerializationKeys.url)
        aCoder.encode(locked, forKey: SerializationKeys.locked)
        aCoder.encode(number, forKey: SerializationKeys.number)
        aCoder.encode(authorAssociation, forKey: SerializationKeys.authorAssociation)
        aCoder.encode(assignees, forKey: SerializationKeys.assignees)
        aCoder.encode(milestone, forKey: SerializationKeys.milestone)
        aCoder.encode(labelsUrl, forKey: SerializationKeys.labelsUrl)
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(pullRequest, forKey: SerializationKeys.pullRequest)
        aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
        aCoder.encode(comments, forKey: SerializationKeys.comments)
        aCoder.encode(title, forKey: SerializationKeys.title)
        aCoder.encode(commentsUrl, forKey: SerializationKeys.commentsUrl)
        aCoder.encode(repositoryUrl, forKey: SerializationKeys.repositoryUrl)
        aCoder.encode(nodeId, forKey: SerializationKeys.nodeId)
        aCoder.encode(eventsUrl, forKey: SerializationKeys.eventsUrl)
    }
    
}
