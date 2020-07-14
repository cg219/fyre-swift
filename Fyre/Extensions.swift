 import SwiftUI
 
 extension Double {
    var currency: String { return String(format: "%.2f", self) }
}
 
extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
    static var double: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
 }
