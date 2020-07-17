import SwiftUI

class UserData: ObservableObject {
    @Published var accounts: [Account]
    @Published var edited: (Int, Int) = (0, 0)

    init() {
        var savings = Account("Ally Savings", .Savings)
        var brokerage = Account("Fidelity Regular", .Brokerage)
        var digital = Account("Crypto Wallet", .Digital)
        var roth = Account("Roth IRA", .Retirement)
        
        brokerage.add(account1)
        roth.add(account2)
        digital.add(account3)
        savings.add(account4)
        
        self.accounts = [savings, digital, brokerage, roth]
    }
}
