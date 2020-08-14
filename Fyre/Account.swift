import Foundation
import CoreData

enum AccountType: String {
    case Savings = "Savings"
    case Checkings = "Checkings"
    case Retirement = "Retirement"
    case Brokerage = "Brokerage"
    case Digital = "Digital"
    case Lender = "Lender"
    case Property = "Property"
}

class Account: ObservableObject, Hashable {
    var id = UUID()
    let type: AccountType
    var name: String
    @Published var assets: [Asset]
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
            
            if checkAsset.code == currentAsset.code {
                exists = true
                existingIndex = index
                break
            }
        }
        
        return (exists, existingIndex)
    }
    
    func add(_ toAdd: Asset) {
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
    
    func add(_ toAddArray: [Asset]) {
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
