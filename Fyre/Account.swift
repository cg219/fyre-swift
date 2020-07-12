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
    var value: Double {
        var currentValue: Double = 0
        assets.forEach { asset in
            currentValue += (asset.amount * asset.value)
        }
        return currentValue
    }
    
    init(_ name: String, _ type: AccountType = .Savings) {
        self.name = name
        self.type = type
        self.assets = []
    }
    
    private func doesAssetExist(_ checkAsset: Asset) -> (Bool, Int) {
        let type: AssetType = checkAsset.type
        var currentAsset: Asset
        var exists: Bool = false
        var existingIndex: Int = 0
        
        for index in 0..<assets.count {
            currentAsset = assets[index]
            
            if currentAsset.type != type { continue }
            
            switch type {
            case .Cash, .Crypto:
                if (checkAsset as! Cash).currency == (currentAsset as! Cash).currency {
                    exists = true
                    existingIndex = index
                    break
                }
            case .Stock:
                if (checkAsset as! Stock).ticker == (currentAsset as! Stock).ticker {
                    exists = true
                    existingIndex = index
                    break
                }
            }
        }
        
        return (exists, existingIndex)
    }
    
    mutating func add(_ toAdd: Asset) {
        let (doesExist, assetIndex) = doesAssetExist(toAdd)
        
        if doesExist {
            var currentAsset:Asset = assets[assetIndex]
            
            switch currentAsset.type {
            case .Cash:
                    currentAsset.amount += toAdd.amount
                    currentAsset.cost += currentAsset.amount
            case .Crypto:
                    currentAsset.amount += toAdd.amount
                    currentAsset.cost += toAdd.cost
            case .Stock:
                    currentAsset.amount += toAdd.amount
                    currentAsset.cost += toAdd.cost
            }
            
            assets[assetIndex] = currentAsset
        } else {
            assets.append(toAdd)
        }
    }
    
    mutating func add(_ toAddArray: [Asset]) {
        toAddArray.forEach { asset in add(asset) }
    }
    
    // Protocol Methods
    static func == (lhs: Account, rhs:Account) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
