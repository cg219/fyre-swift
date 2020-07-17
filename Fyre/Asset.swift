import Foundation

enum AssetType: String {
    case Stock = "Stock"
    case Cash = "Cash"
    case Crypto = "Crypto"
}

enum StockSector: String {
    case Financials = "Financials"
    case Utils = "Utilities"
    case Disc = "Consumer Discretionary"
    case Staples = "Consumer Staples"
    case Energy = "Energy"
    case Health = "Health Care"
    case Industrials = "Industrials"
    case Tech = "Technology"
    case Tele = "Telecom"
    case Mats = "Materials"
    case Estate = "Real Estate"
    case Other = "Other"
    case None = "None"
}

struct Asset: Identifiable {
    var id = UUID()
    let code: String
    let name: String
    let type: AssetType
    var value: Double
    var cost: Double
    var amount: Double
    let sector: StockSector

    init(_ name: String, _ amount: Double = 0, _ code: String = "USD") {
        self.name = name
        self.code = code
        self.value = 1
        self.cost = amount
        self.amount = amount
        self.sector = .None
        self.type = .Cash
    }
    
    init(_ name: String, _ value: Double, _ code: String, _ cost: Double = 0, _ amount: Double = 0, _ sector: StockSector = StockSector.Other) {
        self.name = name
        self.code = code
        self.value = value
        self.cost = cost
        self.amount = amount
        self.sector = sector
        self.type = .Stock
    }
    
    init(_ name: String, _ value: Double, _ code: String, _ cost: Double = 0, _ amount: Double = 0) {
        self.name = name
        self.code = code
        self.value = value
        self.cost = cost
        self.amount = amount
        self.sector = .None
        self.type = .Crypto
    }
    
    mutating func update(amount: Double) -> Asset {
        self.amount = amount
        self.cost = amount
        return self
    }
    
    mutating func update(cost: Double, amount: Double) -> Asset {
        self.amount = amount
        self.cost = cost
        return self
    }
}

let account1:[Asset] = [
    Asset("Apple Inc", 372.69, "AAPL", 3000, 12, .Tech),
    Asset("Tesla", 1372.69, "TSLA", 3000, 4, .Tech),
    Asset("Facebook", 1372.69, "FB", 3000, 19, .Tele),
    Asset("US Dollar", 233)
]

let account2:[Asset] = [
    Asset("Facebook", 1372.69, "FB", 1372.69, 1, .Tele),
    Asset("US Dollar", 4312)
]

let account3:[Asset] = [
    Asset("Bitcoin", 9248.45, "BTC", 1000, 0.12),
    Asset("Litecoin", 43.45, "LTC", 1300, 20),
    Asset("Bitcoin Cash", 234.43, "BCH", 500, 2)
]

let account4:[Asset] = [
    Asset("US Dollar", 19320)
]
