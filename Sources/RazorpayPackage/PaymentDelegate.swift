//
//  PaymentDelegate.swift
//  RazorpayPackage
//
//  Created by Mitesh on 1/3/25.
//

public protocol PaymentDelegate {
    
    func didCompletePayment(response: PaymentResponse)
    func didFailPayment(error: Error)
    func didClose()
}

public struct PaymentResponse {
    public let paymentId: String
    public let response: [AnyHashable : Any]?
}
