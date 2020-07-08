import Foundation

enum AssetType: String {
    case Basic = "Basic"
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

class Asset: Hashable {
    let id: UUID = UUID()
    let name: String
    let type: AssetType
    var value: Double
    
    init(_ name: String, _ value: Double, _ type:AssetType = .Basic) {
        self.name = name
        self.value = value
        self.type = type;
    }
    
    func update(value: Double) -> Void {
        self.value = value
        print("Value Updated")
    }
    
    static func == (lhs: Asset, rhs: Asset) -> Bool {
        return lhs.id as AnyObject === rhs.id as AnyObject
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

class Stock: Asset {
    let ticker: String
    let sector: StockSector
    
    init(_ name: String, _ value: Double, _ ticker: String, _ sector: StockSector = StockSector.Other) {
        self.ticker = ticker
        self.sector = sector
        super.init(name, value, AssetType.Stock)
    }
}

class Cash: Asset {
    let currency: String
    
    init(_ name: String, _ currency:String = "USD") {
        self.currency = currency
        super.init(name, 1, AssetType.Cash)
    }
}

class Crypto: Asset {
    let currency: String
    
    init(_ name: String, _ value: Double, _ currency: String) {
        self.currency = currency
        super.init(name, value, AssetType.Crypto)
    }
}
