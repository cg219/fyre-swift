import SwiftUI
import CoreData

class UserData: ObservableObject {
    @Published var accounts: [Account] = []
    @Published var edited: (Int, Int) = (0, 0)
    let store: Store

    init() {
//        let savings = Account("Ally Savings", .Savings)
//        let brokerage = Account("Fidelity Regular", .Brokerage)
//        let digital = Account("Crypto Wallet", .Digital)
//        let roth = Account("Roth IRA", .Retirement)
        
//        brokerage.add(account1)
//        roth.add(account2)
//        digital.add(account3)
//        savings.add(account4)
        
//        self.accounts = [savings, digital, brokerage, roth]
        self.store = Store("FyreData")
        getData()
    }
    
    public func addAccount() {
        print("ADD ACCOUNT")
    }
    
    func getData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AccountModel")
            
        do {
            let results = try self.store.container.viewContext.fetch(request)
            
            extractData(results as! [NSManagedObject])
            
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func extractData(_ rawData: [NSManagedObject]) {
        for accountData in rawData {
            self.accounts.append(getAccount(data: accountData))
        }
    }
    
    func createAccount(name: String, type: AccountType) {
        self.accounts.append(Account(name, type));
    }
    
    func getAccount(data: NSManagedObject) -> Account {
        let name = data.value(forKey: "name") as! String
        let type = data.value(forKey: "type") as! AccountType
        let id = data.value(forKey: "id") as! UUID
        let rawAssets = data.value(forKey: "assets") as! [NSObject]
        let account: Account = Account(name, type)
        var assets: [Asset] = []
        
        account.id = id
        
        for assetData in rawAssets {
            assets.append(getAsset(data: assetData))
        }
        
        account.add(assets);
        
        return account
    }
    
    func getAsset(data: NSObject) -> Asset {
        let name = data.value(forKey: "name") as! String
        let id = data.value(forKey: "id") as! UUID
        let code = data.value(forKey: "code") as! String
        let sector = data.value(forKey: "sector") as! StockSector
        let value = data.value(forKey: "value") as! Double
        let cost = data.value(forKey: "cost") as! Double
        let type = data.value(forKey: "type") as! AssetType
        let amount = data.value(forKey: "amount") as! Double
        let asset: Asset = Asset(name, id, code, value, cost, amount, sector, type)
        
        return asset
    }
}
