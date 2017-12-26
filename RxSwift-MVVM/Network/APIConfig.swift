//
//  APIConfig.swift
//  RxSwiftTest
//
//  Created by 小七 on 2017/10/26.
//  Copyright © 2017年 Seven. All rights reserved.
//

import Foundation
import Moya

enum APIConfig {
    case top
}

extension APIConfig: TargetType {
    var sampleData: Data {
        return "{}".data(using: .utf8)!
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var baseURL: URL {
        return URL.init(string: "https://api.douban.com/v2/movie/")!
    }
    
    var path: String {
        switch self {
        case .top:
            return "top250"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .top:
            return .get
        }
    }
}
