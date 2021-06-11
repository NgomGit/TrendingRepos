//
//  WebClient.swift
//  TrendingRepos
//
//  Created by Ngom_dxn on 6/11/21.
//

import Foundation

protocol Dispatcher: AnyObject {
  
  var baseURLString: String { get set }
  var session: URLSession { get set }
  
  init(session: URLSession)
  
  func execute(request: Request, completion: @escaping (Result<JSON, NetworkError>)->())
  
}


final class WebClient: Dispatcher {
  
  var baseURLString: String = "https://api.github.com/"
  
  var session: URLSession
  
  required init(session: URLSession) {
    self.session = session
  }
  
  convenience init(baseURLString: String) {
    self.init(session: URLSession(configuration: .default))
    self.baseURLString = baseURLString
  }
  
  func execute(request: Request, completion: @escaping (Result<JSON, NetworkError>)->()) {
    let reachability = Reachability()
    guard reachability!.isReachable else { completion(.failure(.noInternetConnexion)); return }
    
    let sessionRequest = prepareURLRequest(for: request)
    let task = session.dataTask(with: sessionRequest) { (data, response, error) in
      
      if (error == nil) {
        guard let data = data, let jsonData = try? JSON(data: data)
        else {
          completion(.failure(.otherReasons))
          return
        }
        completion(.success(jsonData))
      }
      else {
        completion(.failure(NetworkError.otherReasons))
        
      }
    }
    task.resume()
  }
  
  
  func prepareURLRequest(for request: Request) -> URLRequest {
    
    let fullURLString = baseURLString + request.path
    guard let url = URL(string: fullURLString) else { fatalError("The URL is not valid") }
    var urlRequest = URLRequest(url: url)
    
    if let params = request.params {
      switch params {
        case .body(let bodyParams):
          urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: bodyParams, options: .init(rawValue: 0))
        case .url(let urlParams):
          var components = URLComponents(string: fullURLString)!
          components.queryItems = urlParams.map { URLQueryItem(name: $0.key, value: String(describing: $0.value)) }
      }
    }
    
    if let headers = request.headers { headers.forEach { urlRequest.addValue($0.value , forHTTPHeaderField: $0.key) } }
    urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
    urlRequest.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    
    urlRequest.httpMethod = request.method.rawValue
    return urlRequest
  }
  
}

