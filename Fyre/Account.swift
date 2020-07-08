import Foundation

enum AccountType {
    case Savings
    case Checkings
    case Retirement
    case Brokerage
    case Digital
    case Lender
    case Property
}

struct Account: Identifiable {
    let id: UUID = UUID()
    let type: AccountType
    var name: String
    var assets = Set<Asset>()
    var values: [Asset: (amount: Double, investment: Double)] = [:]
    
    init(_ type: AccountType, _ name: String) {
        self.type = type
        self.name = name
    }
    
    mutating func update(_ asset: Asset, _ amount: Double, _ price: Double) {
        let asset = self.assets.insert(asset)
        
        if asset.0 {
            let prevAmount = values[asset.1]?.amount
            let prevPrice = values[asset.1]?.investment
            
            values[asset.1] = (amount + prevAmount!, price + prevPrice!)
        } else {
            values[asset.1] = (amount, price)
        }
    }
    
    mutating func delete(_ asset: Asset) {
        let asset = self.assets.remove(asset)
        
        if asset != nil {
            values[asset!] = nil
        }
    }
    
    func value() -> Double {
        return 0.00
    }
}

struct Wallet {
    var wallet = [Account]()
    
    init(_ accounts:[Account]) {
        self.wallet += accounts
    }
}

let testCash:Cash = Cash("USD")
var testAccount1:Account = Account(.Savings, "Savings Account")
var testAccount2:Account = Account(.Brokerage, "Brokerage Account")
var testWallet:Wallet = Wallet([testAccount1, testAccount2])
