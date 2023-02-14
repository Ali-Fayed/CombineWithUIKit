//
//  Identifier.swift
//  CombineWithUIKit
//
//  Created by AliFayed on 14/02/2023.
//

import Foundation
extension NSObject {
    static var identifier: String {
        return String(describing: self)
    }
}
