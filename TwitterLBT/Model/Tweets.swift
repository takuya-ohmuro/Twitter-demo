//
//  Tweets.swift
//  TwitterLBT
//
//  Created by 大室拓也 on 2018/04/09.
//  Copyright © 2018年 taku9321. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON


struct Tweet:JSONDecodable {
    let user:User
    let message:String
    
    init(json:JSON) {
        let userJson = json["user"]
        self.user = User(json:userJson)
        
        self.message = json["message"].stringValue
    }
}
