//
//  Repository.swift
//  
//
//  Created by Muhamad Fardan Wardhana on 02/08/23.
//

import Combine

public protocol Repository {
  associatedtype Request
  associatedtype Response
  
  func execute(request: Request?) -> AnyPublisher<Response, Error>
}
