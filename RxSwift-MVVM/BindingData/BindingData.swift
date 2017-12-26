//
//  BindingData.swift
//  RxSwiftTest
//
//  Created by 小七 on 2017/11/2.
//  Copyright © 2017年 Seven. All rights reserved.
//

import Foundation
import RxSwift

struct BindingData {
    var title = Variable<String>("")
    
    init(_ title: String?) {
        self.title.value = title ?? ""
    }
}
