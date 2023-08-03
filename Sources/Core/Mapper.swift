//
//  Mapper.swift
//  
//
//  Created by Muhamad Fardan Wardhana on 02/08/23.
//

import Foundation

public protocol Mapper {
  associatedtype Response
  associatedtype Entity
  associatedtype Domain
  
  func transformResponseToEntity(response: Response) -> Entity
  func transformEntityToDomain(entity: Entity) -> Domain
}
