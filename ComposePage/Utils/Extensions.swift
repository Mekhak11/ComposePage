//
//  Extensions.swift
//  ComposePage
//
//  Created by MEKHAK GHAPANTSYAN on 18.06.23.
//

import Foundation


extension Array where Element == String {
    func characterCountSum() -> Int {
        var sum = 0
        for string in self {
            sum += string.count
        }
        return sum
    }
    
}
extension String {
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
}
