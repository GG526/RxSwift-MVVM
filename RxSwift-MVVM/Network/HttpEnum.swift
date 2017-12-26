//
//  ResponseResult.swift
//  RxSwiftTest
//
//  Created by 小七 on 2017/11/3.
//  Copyright © 2017年 Seven. All rights reserved.
//

import UIKit

enum ResponseResult <T: Codable> {
    case empty
    case succeed(data: T)
    case failed(message: String)
}

enum RequestStatus {
    case empty
    case succees
    case failed
}
