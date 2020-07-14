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
}

protocol Asset {
    var name: String { get }
    var type: AssetType { get }
    var value: Double { get set }
    var amount: Double { get set }
    var cost: Double { get set }
    var id: UUID { get set }
}

struct Cash: Asset, Identifiable {
    var id = UUID()
    let currency: String
    let name: String
    let type: AssetType = .Cash
    var value: Double
    var cost: Double
    var amount: Double
    
    init(_ name: String, _ amount: Double = 0, _ currency: String = "USD") {
        self.name = name
        self.currency = currency
        self.value = 1
        self.cost = amount
        self.amount = amount
    }
}

struct Stock: Asset, Identifiable {
    var id = UUID()
    let name: String
    let type: AssetType = .Stock
    let ticker: String
    let sector: StockSector
    var value: Double
    var cost: Double
    var amount: Double
    
    init(_ name: String, _ value: Double, _ ticker: String, _ cost: Double = 0, _ amount: Double = 0, _ sector: StockSector = StockSector.Other) {
        self.ticker = ticker
        self.sector = sector
        self.name = name
        self.value = value
        self.cost = cost
        self.amount = amount
    }
}

struct Crypto: Asset, Identifiable {
    var id = UUID()
    let currency: String
    let name: String
    let type: AssetType = .Crypto
    var value: Double
    var cost: Double
    var amount: Double
    
    init(_ name: String, _ value: Double, _ currency: String, _ cost: Double = 0, _ amount: Double = 0) {
        self.currency = currency
        self.name = name
        self.value = value
        self.cost = cost
        self.amount = amount
    }
}

let account1:[Asset] = [
    Stock("Apple Inc", 372.69, "AAPL", 3000, 12, .Tech),
    Stock("Tesla", 1372.69, "TSLA", 3000, 4, .Tech),
    Stock("Facebook", 1372.69, "FB", 3000, 19, .Tele),
    Cash("US Dollar", 233)
]

let account2:[Asset] = [
    Stock("Facebook", 1372.69, "FB", 1372.69, 1, .Tele),
    Cash("US Dollar", 4312)
]

let account3:[Asset] = [
    Crypto("Bitcoin", 9248.45, "BTC", 1000, 0.12),
    Crypto("Litecoin", 43.45, "LTC", 1300, 20),
    Crypto("Bitcoin Cash", 234.43, "BCH", 500, 2)
]

let account4:[Asset] = [
    Cash("US Dollar", 19320)
]
