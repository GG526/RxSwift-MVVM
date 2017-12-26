//
//  ReponseResult.swift
//  RxSwiftTest
//
//  Created by 小七 on 2017/10/24.
//  Copyright © 2017年 Seven. All rights reserved.
//

import Foundation

class ReponseData<T: Codable>: Codable {
    var count: Int?
    var start: Int?
    var total: Int?
    var subjects: T?
}

