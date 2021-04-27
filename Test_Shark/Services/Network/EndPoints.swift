//
//  EndPoints.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 21.04.2021.
//

import Foundation
import Alamofire

enum EndPoints: APIConfiguration {
    
    case getCurrency(currency: String)
    
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
            
        case .getCurrency:
            return .get
            
        }
        
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .getCurrency:
            return nil
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .getCurrency(let currency):
            return "/v6/latest/\(currency)"
        }
        
    }
    
    // MARK: - Parameters
    var parameters: RequestParams {
        switch self {
        case .getCurrency:
            return .url([:])
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try "https://open.exchangerate-api.com".asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        print(urlRequest)
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers

        
        // Parameters
        switch parameters {
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            
        case .url(let params):
            let queryParams = params.map { pair  in
                return URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
        }
        return urlRequest
    }
}

