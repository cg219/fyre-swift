import Foundation

struct NewAccount {
    var name: String = ""
    var type: AccountType = .Savings
}

struct NewAsset {
    var name: String = ""
    var code: String = ""
    var type: AssetType = .Cash
    var value: Double = 0
    var cost: Double = 0
    var amount: Double = 0
    var sector: StockSector = .None
    var account: Int = 0
}

struct Asset: Identifiable, Hashable {
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
    
    init(_ name: String, _ id: UUID, _ code: String, _ value: Double, _ cost: Double, _ amount: Double, _ sector: StockSector, _ type: AssetType) {
        self.name = name
        self.code = code
        self.value = value
        self.cost = cost
        self.amount = amount
        self.sector = sector
        self.type = type
        self.id = id
    }
    
    // Protocol Methods
    static func == (lhs: Asset, rhs:Asset) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
