//
//  LXExtension-UIFont.swift
//  LXSamsProject
//
//  Created by laxman penmetsa on 12/17/18.
//  Copyright © 2018 com.laxman. All rights reserved.
//

import UIKit

public extension UIFont {
    static func LXBook(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func LXBold(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func LXLight(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func LXBookItalic(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Italic", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func LXLightItalic(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-LightItalic", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func LXBoldItalic(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-BoldItalic", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func LXMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func LXMediumItalic(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-MediumItalic", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}
