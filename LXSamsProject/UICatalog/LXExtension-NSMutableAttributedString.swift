//
//  LXExtension-NSMutableAttributedString.swift
//  LXSamsProject
//
//  Created by laxman penmetsa on 12/18/18.
//  Copyright © 2018 com.laxman. All rights reserved.
//

import Foundation
import  UIKit

public extension NSMutableAttributedString {
    @discardableResult func bold(_ text:String, size: CGFloat, color: UIColor = UIColor.black) -> NSMutableAttributedString {
        let mediumString = NSAttributedString.attributed(string: text, font: UIFont.LXBold(size: size), color: color)
        self.append(mediumString)
        return self
    }
    
    @discardableResult func book(_ text:String, size: CGFloat, color: UIColor = UIColor.black) -> NSMutableAttributedString {
        let mediumString = NSAttributedString.attributed(string: text, font: UIFont.LXBook(size: size), color: color)
        self.append(mediumString)
        return self
    }
    
    @discardableResult func medium(_ text:String, size: CGFloat, color: UIColor = UIColor.black) -> NSMutableAttributedString {
        let mediumString = NSAttributedString.attributed(string: text, font: UIFont.LXMedium(size: size), color: color)
        self.append(mediumString)
        return self
    }
    
    @discardableResult func italic(_ text:String, size: CGFloat, color: UIColor = UIColor.black) -> NSMutableAttributedString {
        let mediumString = NSAttributedString.attributed(string: text, font: UIFont.LXBookItalic(size: size), color: color)
        self.append(mediumString)
        return self
    }
}
