//
//  Service.swift
//  TwitterLBT
//
//  Created by 大室拓也 on 2018/04/12.
//  Copyright © 2018年 taku9321. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    func fetchHomeFeed(completion: @escaping (HomeDatasource?,Error?)->()) {
        let rquest:APIRequest<HomeDatasource,JsonError> = tron.swiftyJSON.request("/twitter/home")
        rquest.perform(withSuccess: {(homeDatasource) in
            completion(homeDatasource, nil)
     //       self.datasource = homeDatasource
        }) {(err) in
            completion(nil, err)
            print("faild to fetch json,,,,",err)
        }
    }
    class JsonError:JSONDecodable {
        required init(json: JSON) throws {
            print("Json Error")
        }
    }
}
