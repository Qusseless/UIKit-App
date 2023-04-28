//
//  DecimalUtil.swift
//  BankeyRepeat
//
//  Created by Ilya Volkorez on 2023-04-28.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
