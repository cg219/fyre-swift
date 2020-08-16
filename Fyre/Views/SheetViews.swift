import SwiftUI

struct AddAccountView: View {
    @Binding var isShowing: Bool
    @State var account: NewAccount = NewAccount()
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Add Account")
                Spacer()
            }
            TextField("Account Name", text: $account.name)
            Picker("Account Type", selection: $account.type) {
                ForEach(AccountType.allCases, id: \.self) { type in
                    Text(type.rawValue)
                        .tag(type)
                }
            }
            HStack {
                Spacer()
                Button("Cancel") {
                    isShowing = false
                }
                Button("Add") {
                    userData.saveAccount(newAccount: account)
                    isShowing = false
                }
                Spacer()
            }
        }
        .frame(width: 300, height: 100, alignment: .center)
        .padding(20)
    }
}

struct AddAssetView: View {
    @State var asset: NewAsset = NewAsset()
    @EnvironmentObject var userData: UserData
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Add Asset")
                Spacer()
            }
            HStack {
                TextField("Name", text: $asset.name)
                TextField("Symbol", text: $asset.code)
            }
            HStack {
                TextField("Amount", value: $asset.amount, formatter: NumberFormatter.normal)
                TextField("Total Cost", value: $asset.cost, formatter: NumberFormatter.normal)
            }
            Picker("Account", selection: $asset.account) {
                ForEach(userData.accounts.indices, id: \.self) { index in
                    Text(userData.accounts[index].name)
                        .tag(index)
                }
            }
            Picker("Asset Type", selection: $asset.type) {
                ForEach(AssetType.allCases, id: \.self) { type in
                    Text(type.rawValue)
                        .tag(type)
                }
            }
            Picker("Asset Sector", selection: $asset.type) {
                ForEach(StockSector.allCases, id: \.self) { type in
                    Text(type.rawValue)
                        .tag(type)
                }
            }
            HStack {
                Spacer()
                Button("Cancel") {
                    isShowing = false
                }
                Button("Add") {
                    userData.updateAccount()
                    isShowing = false
                }
                Spacer()
            }
        }
        .frame(width: 300, height: 200, alignment: .center)
        .padding(20)
    }
}

