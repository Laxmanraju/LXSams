//
//  LXDownWrapper.swift
//  LXSamsProject
//
//  Created by laxman penmetsa on 12/21/18.
//  Copyright © 2018 com.laxman. All rights reserved.
//

import Foundation
import Down

public class LXDownWrapper {
    static func getRenderedMarkDownToString( markdownText: String) -> String?{
        let down = Down(markdownString: markdownText)
        /* My CSS skills are poor to get the perfect font styling of the parsed markdown text, so not using the the half styled decoded string and applying the basic styling even across the complete string (including code snippect,  etc) in usage classes*/
        if let downAttriuteString = try? down.toAttributedString(.default, stylesheet: "* {font-family: Helvetica } code, pre { font-family: Menlo },"){
            return  downAttriuteString.string
        }else{
            return nil
        }
    }
}
