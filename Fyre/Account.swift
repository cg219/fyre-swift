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
    var wallet: [Asset: (amount: Double, investment: Double)] = [:]
    
    init(_ type: AccountType, _ name: String) {
        self.type = type
        self.name = name
    }
    
    mutating func update(_ asset: Asset, _ amount: Double, _ price: Double) {
        let asset = self.assets.insert(asset)
        
        if asset.0 {
            let prevAmount = wallet[asset.1]?.amount
            let prevPrice = wallet[asset.1]?.investment
            
            wallet[asset.1] = (amount + prevAmount!, price + prevPrice!)
        } else {
            wallet[asset.1] = (amount, price)
        }
    }
    
    mutating func delete(_ asset: Asset) {
        let asset = self.assets.remove(asset)
        
        if asset != nil {
            wallet[asset!] = nil
        }
    }
}
