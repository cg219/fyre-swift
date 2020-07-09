import Foundation
import SwiftUI

class Wallet: ObservableObject {
    @Published var title = "Wallet Name"
    @Published var accounts:[Account]

    init() {
        var savings = Account("Savings Account", .Savings)
        var brokerage = Account("Brokerage Account", .Brokerage)
        var digital = Account("Coinbase Account", .Digital)

        let cash1 = Cash("US Dollar", 19320)
        let cash2 = Cash("US Dollar", 4000)
        let stock1 = Stock("Apple Inc", 372.69, "AAPL", 3000, 12, .Tech)
        let stock2 = Stock("Tesla", 1372.69, "TSLA", 3000, 4, .Tech)
        let stock3 = Stock("Facebook", 1372.69, "FB", 3000, 19, .Tele)
        let crypto1 = Crypto("Bitcoin", 9248.45, "BTC", 1000, 0.12)
        
        savings.assets.append(cash1)
        brokerage.assets += [cash2, stock1, stock2, stock3]
        digital.assets.append(crypto1)
        
        self.accounts = [savings, digital, brokerage]
    }
}
