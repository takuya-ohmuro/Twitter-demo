//
//  HomeDatasource.swift
//  TwitterLBT
//
//  Created by 大室拓也 on 2018/04/06.
//  Copyright © 2018年 taku9321. All rights reserved.
//

import LBTAComponents
import SwiftyJSON
import TRON

extension Collection where Iterator.Element == JSON {
    func decode<T:JSONDecodable>() throws -> [T] {
        return try map({try T(json:$0)})
    }
}

class HomeDatasource: Datasource,JSONDecodable {
    
    let users:[User]
    
    required init(json: JSON) throws {
        guard let userJsonArray = json["users"].array,let tweetsJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.letsbuildingapp", code: 1, userInfo: [NSLocalizedDescriptionKey:"'Parsing Json was not Vaild"])
        }
        self.users = try userJsonArray.decode()
        self.tweets = try tweetsJsonArray.decode()
        
    }
    let tweets:[Tweet]
    
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self,TweetCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    override func numberOfSections() -> Int {
        return 2
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
}
