//
//  LXMilestone.swift
//
//  Created by Laxman Penmesta on 12/13/18
//  Copyright (c) com.laxman. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class LXMilestone: NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let state = "state"
        static let updatedAt = "updated_at"
        static let openIssues = "open_issues"
        static let htmlUrl = "html_url"
        static let descriptionValue = "description"
        static let number = "number"
        static let creator = "creator"
        static let labelsUrl = "labels_url"
        static let id = "id"
        static let closedIssues = "closed_issues"
        static let createdAt = "created_at"
        static let title = "title"
        static let nodeId = "node_id"
        static let url = "url"
    }
    
    // MARK: Properties
    public var state: String?
    public var updatedAt: String?
    public var openIssues: Int?
    public var htmlUrl: String?
    public var descriptionValue: String?
    public var number: Int?
    public var creator: LXCreator?
    public var labelsUrl: String?
    public var id: Int?
    public var closedIssues: Int?
    public var createdAt: String?
    public var title: String?
    public var nodeId: String?
    public var url: String?
    
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
        updatedAt = json[SerializationKeys.updatedAt].string
        openIssues = json[SerializationKeys.openIssues].int
        htmlUrl = json[SerializationKeys.htmlUrl].string
        descriptionValue = json[SerializationKeys.descriptionValue].string
        number = json[SerializationKeys.number].int
        creator = LXCreator(json: json[SerializationKeys.creator])
        labelsUrl = json[SerializationKeys.labelsUrl].string
        id = json[SerializationKeys.id].int
        closedIssues = json[SerializationKeys.closedIssues].int
        createdAt = json[SerializationKeys.createdAt].string
        title = json[SerializationKeys.title].string
        nodeId = json[SerializationKeys.nodeId].string
        url = json[SerializationKeys.url].string
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = state { dictionary[SerializationKeys.state] = value }
        if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
        if let value = openIssues { dictionary[SerializationKeys.openIssues] = value }
        if let value = htmlUrl { dictionary[SerializationKeys.htmlUrl] = value }
        if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
        if let value = number { dictionary[SerializationKeys.number] = value }
        if let value = creator { dictionary[SerializationKeys.creator] = value.dictionaryRepresentation() }
        if let value = labelsUrl { dictionary[SerializationKeys.labelsUrl] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = closedIssues { dictionary[SerializationKeys.closedIssues] = value }
        if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
        if let value = title { dictionary[SerializationKeys.title] = value }
        if let value = nodeId { dictionary[SerializationKeys.nodeId] = value }
        if let value = url { dictionary[SerializationKeys.url] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.state = aDecoder.decodeObject(forKey: SerializationKeys.state) as? String
        self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
        self.openIssues = aDecoder.decodeObject(forKey: SerializationKeys.openIssues) as? Int
        self.htmlUrl = aDecoder.decodeObject(forKey: SerializationKeys.htmlUrl) as? String
        self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
        self.number = aDecoder.decodeObject(forKey: SerializationKeys.number) as? Int
        self.creator = aDecoder.decodeObject(forKey: SerializationKeys.creator) as? LXCreator
        self.labelsUrl = aDecoder.decodeObject(forKey: SerializationKeys.labelsUrl) as? String
        self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
        self.closedIssues = aDecoder.decodeObject(forKey: SerializationKeys.closedIssues) as? Int
        self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
        self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
        self.nodeId = aDecoder.decodeObject(forKey: SerializationKeys.nodeId) as? String
        self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(state, forKey: SerializationKeys.state)
        aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
        aCoder.encode(openIssues, forKey: SerializationKeys.openIssues)
        aCoder.encode(htmlUrl, forKey: SerializationKeys.htmlUrl)
        aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
        aCoder.encode(number, forKey: SerializationKeys.number)
        aCoder.encode(creator, forKey: SerializationKeys.creator)
        aCoder.encode(labelsUrl, forKey: SerializationKeys.labelsUrl)
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(closedIssues, forKey: SerializationKeys.closedIssues)
        aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
        aCoder.encode(title, forKey: SerializationKeys.title)
        aCoder.encode(nodeId, forKey: SerializationKeys.nodeId)
        aCoder.encode(url, forKey: SerializationKeys.url)
    }
    
}
