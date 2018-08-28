//
//  User.swift
//  TwitterLBT
//
//  Created by 大室拓也 on 2018/04/07.
//  Copyright © 2018年 taku9321. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct User:JSONDecodable {

    let userName:String
    let name:String
    let bioText:String
    let profileImageUrl:String
    
    init(json:JSON) {
        self.name = json["name"].stringValue
        self.userName = json["userName"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImageUrl = json["profileImageUrl"].stringValue
    }
    
}
