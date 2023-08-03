//
//  String+Ext.swift
//  
//
//  Created by Muhamad Fardan Wardhana on 03/08/23.
//

import Foundation

public extension String {
  func localized(identifier: String) -> String {
    let bundle = Bundle(identifier: identifier) ?? .main
    return bundle.localizedString(forKey: self, value: nil, table: nil)
  }
}
