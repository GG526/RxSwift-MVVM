//
//  HttpClient.swift
//  RxSwiftTest
//
//  Created by 小七 on 2017/10/23.
//  Copyright © 2017年 Seven. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import NSObject_Rx
import Moya
import RxMoya

//fileprivate let httpClient = HttpClient()

public class HttpClient: NSObject {
    func request <Element: Codable> (config: APIConfig) -> Observable<ResponseResult<Element>> {
        return Observable.create({[weak self] (observable) -> Disposable in
            let provider = MoyaProvider<APIConfig>()
            let callBack = provider.request(config, completion: { (responseResult) in
                switch responseResult {
                case let .success(response):
                    do {
                        let decoder = JSONDecoder()
                        let data = try decoder.decode(ReponseData<Element>.self, from: response.data)
                        let subjects = data.subjects
                        let result = (subjects == nil) ? ResponseResult.empty : ResponseResult.succeed(data: subjects!)
                        observable.onNext(result)
                    }catch let error {
                        self?.requestError(message: error.localizedDescription)
                        observable.onNext(ResponseResult.failed(message: error.localizedDescription))
                    }
                case let .failure(error):
                    self?.requestError(message: error.localizedDescription)
                    observable.onNext(ResponseResult.failed(message: error.localizedDescription))
                }
            })
            return Disposables.create {
                callBack.cancel()
            }
        })
    }
    
    private func requestError(message: String) {
        // 统一处理错误
    }
}



