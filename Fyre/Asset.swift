import Foundation

class Asset: Hashable {
    let id: UUID = UUID()
    let name: String
    var value: Double
    
    init(_ name: String, _ value: Double) {
        self.name = name
        self.value = value
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
    
    init(_ name: String, _ value: Double, _ ticker: String) {
        self.ticker = ticker
        super.init(name, value)
    }
}

class Cash: Asset {
    
}

class CryptoAsset: Asset {
    let currency: String
    
    init(_ name: String, _ value: Double, _ currency: String) {
        self.currency = currency
        super.init(name, value)
    }
}
