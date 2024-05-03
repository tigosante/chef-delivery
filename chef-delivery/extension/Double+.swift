//
//  Double+.swift
//  chef-delivery
//
//  Created by Tiago Silva on 03/05/24.
//

import Foundation

extension Double {
    func formartPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
