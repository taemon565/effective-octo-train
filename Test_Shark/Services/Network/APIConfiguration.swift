//
//  APIConfiguration.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 21.04.2021.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams { get }
    var headers: HTTPHeaders? { get }
}

enum RequestParams {
    case body(_:Parameters)
    case url(_:Parameters)
}
