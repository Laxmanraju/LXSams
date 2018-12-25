//
//  LXPullRequest.swift
//
//  Created by Laxman Penmesta on 12/13/18
//  Copyright (c) com.laxman. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class LXPullRequest: NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let diffUrl = "diff_url"
        static let patchUrl = "patch_url"
        static let htmlUrl = "html_url"
        static let url = "url"
    }
    
    // MARK: Properties
    public var diffUrl: String?
    public var patchUrl: String?
    public var htmlUrl: String?
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
        diffUrl = json[SerializationKeys.diffUrl].string
        patchUrl = json[SerializationKeys.patchUrl].string
        htmlUrl = json[SerializationKeys.htmlUrl].string
        url = json[SerializationKeys.url].string
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = diffUrl { dictionary[SerializationKeys.diffUrl] = value }
        if let value = patchUrl { dictionary[SerializationKeys.patchUrl] = value }
        if let value = htmlUrl { dictionary[SerializationKeys.htmlUrl] = value }
        if let value = url { dictionary[SerializationKeys.url] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.diffUrl = aDecoder.decodeObject(forKey: SerializationKeys.diffUrl) as? String
        self.patchUrl = aDecoder.decodeObject(forKey: SerializationKeys.patchUrl) as? String
        self.htmlUrl = aDecoder.decodeObject(forKey: SerializationKeys.htmlUrl) as? String
        self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(diffUrl, forKey: SerializationKeys.diffUrl)
        aCoder.encode(patchUrl, forKey: SerializationKeys.patchUrl)
        aCoder.encode(htmlUrl, forKey: SerializationKeys.htmlUrl)
        aCoder.encode(url, forKey: SerializationKeys.url)
    }
    
}
