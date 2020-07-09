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
