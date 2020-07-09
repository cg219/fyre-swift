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

struct AssetHolder: Identifiable {
    var id = UUID()
    var asset: Asset
    var amount: Double
    var price: Double
}

struct Account: Hashable {
    var id = UUID()
    let type: AccountType
    var name: String
    var assets: [Asset]
    
    init(_ name: String, _ type: AccountType = .Savings) {
        self.name = name
        self.type = type
        self.assets = []
    }
    
    static func == (lhs: Account, rhs:Account) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
