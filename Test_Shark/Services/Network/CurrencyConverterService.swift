//
//  CurrencyConverterService.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 21.04.2021.
//

import UIKit
import Alamofire

protocol CurrencyConverterServiceProtocol {
	func getCurrency(baseCode: String, completion: @escaping (Currency?, Errors?) -> ())
}

class CurrencyConverterService: CurrencyConverterServiceProtocol {
    @discardableResult
    private func performRequest(route: EndPoints, completion: @escaping (AFDataResponse<Any>?) -> Void) -> DataRequest {
        return AF.request(route).validate().responseJSON { (response: AFDataResponse<Any>?) in
            //print(response)
            completion(response)
        }
    }

    func getCurrency(baseCode: String, completion: @escaping (Currency?, Errors?) -> ()) {
        performRequest(route: .getCurrency(currency: baseCode)) { response in
            if response?.error == nil {
                if let data = response?.data, let utf8Text = String(data: data, encoding: .utf8) {
                    let json = utf8Text.data(using: .utf8)
                    //print(json)
                    do {
                        let decoder = JSONDecoder()
                        let decodedJson = try decoder.decode(Currency.self, from: json!)
                        //print(decodedJson)
                        completion(decodedJson, .success)
                    } catch {
                        completion(nil, .failure)
                    }
                }
            } else {
                completion(nil, .failure)
            }
        }
    }
}
