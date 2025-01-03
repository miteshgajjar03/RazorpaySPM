//
//  File.swift
//  RazorpayPackage
//
//  Created by Mitesh on 1/3/25.
//

import Foundation

public struct RazorpayPaymentMeta {
    let key: String
    let secretKey: String
    
    public init(key: String, secretKey: String) {
        self.key = key
        self.secretKey = secretKey
    }
}
