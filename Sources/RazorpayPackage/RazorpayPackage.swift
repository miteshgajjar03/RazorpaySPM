// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import Razorpay

public class MMRazorpay {
    
    private let paymentMeta: RazorpayPaymentMeta!
    private var razorpay: RazorpayCheckout!
    private var delegate: PaymentDelegate
    
    public init(meta: RazorpayPaymentMeta, delegate: PaymentDelegate) {
        self.paymentMeta = meta
        self.delegate = delegate
    }
    
    public func makePayment(viewController: UIViewController, options: [String: Any]) {
        
        if razorpay == nil {
            razorpay = RazorpayCheckout.initWithKey(paymentMeta.key, andDelegateWithData: self)
        }
        razorpay.open(options, displayController: viewController)
    }
    
    public func clearUserData() {
        razorpay.clearUserData()
    }
    
    public func close() {
        razorpay.close()
        delegate.didClose()
    }
}

extension MMRazorpay: RazorpayPaymentCompletionProtocolWithData {
    
    public func onPaymentError(_ code: Int32, description str: String, andData response: [AnyHashable : Any]?) {
        let error = NSError(domain: "MMRazorpay", code: Int(code), userInfo: [NSLocalizedDescriptionKey: str])
        delegate.didFailPayment(error: error)
    }
    
    public func onPaymentSuccess(_ payment_id: String, andData response: [AnyHashable : Any]?) {
        delegate.didCompletePayment(response: PaymentResponse(paymentId: payment_id, response: response))
    }
}
