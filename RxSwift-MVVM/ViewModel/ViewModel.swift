//
//  ViewModel.swift
//  RxSwiftTest
//
//  Created by 小七 on 2017/10/25.
//  Copyright © 2017年 Seven. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import NSObject_Rx

class ViewModel: NSObject {
    private var model = Model()
    private var list = [Subjects]()
    private var errorMessage: String = ""
    
    func getData(callBack: @escaping (_ result: RequestStatus) -> Void) {
        model.getData().subscribe(onNext: {[weak self] (result) in
            switch result {
            case .empty:
                callBack(.empty)
            case .succeed(let data):
                self?.list = data
                callBack(.succees)
            case .failed(let errorMessage):
                self?.errorMessage = errorMessage
                callBack(.failed)
            }
        }).disposed(by: rx.disposeBag)
    }
    
    func getItemCount() -> Int {
        return list.count
    }
    
    func getBindData(index: Int) -> BindingData {
        return BindingData.init(list[index].title)
    }
    // 获取网络错误信息
    func getErrorMessage() -> String {
        return errorMessage
    }
}
