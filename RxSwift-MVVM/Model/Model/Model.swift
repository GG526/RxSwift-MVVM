//
//  Model.swift
//  RxSwiftTest
//
//  Created by 小七 on 2017/10/25.
//  Copyright © 2017年 Seven. All rights reserved.
//

import Foundation
import RxSwift
import NSObject_Rx

class Model: NSObject {

    public func getData() -> Observable<ResponseResult<[Subjects]>> {
        return HttpClient().request(config: APIConfig.top)
    }
}
