//
//  DataSource.swift
//  
//
//  Created by Muhamad Fardan Wardhana on 02/08/23.
//

import Combine

public protocol DataSource {
  associatedtype Request
  associatedtype Response
  
  func execute(request: Request?) -> AnyPublisher<Response, Error>
}
