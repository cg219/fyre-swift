import SwiftUI

//struct AssetListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AssetListView()
//            .environmentObject(UserData())
//    }
//}

let assetImage: [AssetType: String] = [
    AssetType.Cash: "dollarsign.square.fill",
    AssetType.Crypto: "bitcoinsign.square.fill",
    AssetType.Stock: "mail.fill"
]

func sendAssets(_ asset: Asset, _ account: Account, _ userData: UserData) {
    let accountIndex: Int = userData.accounts.firstIndex(where: { $0.id == account.id })!
    let assetIndex: Int = userData.accounts[accountIndex].assets.firstIndex(where: { $0.id == asset.id})!
    
    userData.edited = (accountIndex, assetIndex)
}

struct AssetListView: View {
    @EnvironmentObject var userData: UserData
    @Binding var showEdit: Bool
    
    var body: some View {
        List {
            ForEach(userData.accounts, id: \.self) { account in
                Section(header: SectionView(account: account)) {
                    ForEach(account.assets, id: \.id) { asset in
                        switch asset.type {
                            case .Cash:
                                CashItem(asset: asset)
                                    .onTapGesture {
                                        sendAssets(asset, account, userData)
                                        withAnimation(.easeInOut(duration: 0.5)) {
                                            showEdit = true
                                        }
                                    }
                            case .Stock:
                                StockItem(asset: asset)
                                    .onTapGesture {
                                        sendAssets(asset, account, userData)
                                        withAnimation(.easeInOut(duration: 0.5)) {
                                            showEdit = true
                                        }
                                    }
                            case .Crypto:
                                CryptoItem(asset: asset)
                                    .onTapGesture {
                                        sendAssets(asset, account, userData)
                                        withAnimation(.easeInOut(duration: 0.5)) {
                                            showEdit = true
                                        }
                                    }
                        }
                    }
                    .cornerRadius(10)
                }
            }
        }
        .listStyle(PlainListStyle())
        
    }
}

struct SectionView: View {
    @ObservedObject var account: Account
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text("\(account.name)")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top, 5)
                .textCase(.uppercase)
            Spacer()
            Text("$\(account.value.currency)")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.green)
                .kerning(0.6)
        }
        .padding(.all, 10)
        .padding(.top, 20)
        .cornerRadius(7)
    }
}

struct CashItem: View {
    let asset: Asset
    
    var body: some View {
        HStack {
            Group {
                Image(systemName: assetImage[asset.type]!)
                    .foregroundColor(.green)
                    .font(.largeTitle)
                Text("\(asset.code)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Text("\(asset.name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                .padding(.trailing, 10)
                Spacer()
                Text((asset.value * asset.amount).currency)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.black)
        }
        .padding(.all, 20)
        .background(Color.white)
    }
}

struct StockItem: View {
    let asset: Asset
    
    var body: some View {
        HStack {
            Group {
                Image(systemName: assetImage[asset.type]!)
                    .foregroundColor(.blue)
                    .font(.largeTitle)
                .padding(.trailing, 10)
                VStack(alignment: .leading) {
                    Text(asset.amount.currency)
                        .font(.caption)
                        .fontWeight(.medium)
                    Text((asset.value * asset.amount).currency)
                        .font(.caption2)
                        .fontWeight(.semibold)
                }
                .padding(.trailing, 10)
                Text(asset.value.currency)
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.trailing, 10)
                VStack(alignment: .leading) {
                    Text("\(asset.code)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("\(asset.name)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text((asset.value * asset.amount).currency)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text(asset.cost.currency)
                        .font(.caption)
                        .fontWeight(.medium)
                }
                    
            }
            .foregroundColor(.black)
        }
        .padding(.all, 20)
        .background(Color.white)
    }
}

struct CryptoItem: View {
    let asset: Asset
    
    var body: some View {
        HStack {
            Group {
                Image(systemName: assetImage[asset.type]!)
                    .foregroundColor(.yellow)
                    .font(.largeTitle)
                VStack(alignment: .leading) {
                    Text(asset.amount.currency)
                        .font(.caption)
                        .fontWeight(.medium)
                    Text("$\((asset.cost / asset.amount).currency)")
                        .font(.caption2)
                        .fontWeight(.semibold)
                }
                .padding(.trailing, 10)
                Text(asset.value.currency)
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.trailing, 10)
                VStack(alignment: .leading) {
                    Text("\(asset.code)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("\(asset.name)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding(.trailing, 10)
                Spacer()
                VStack(alignment: .trailing) {
                    Text((asset.value * asset.amount).currency)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text(asset.cost.currency)
                        .font(.caption)
                        .fontWeight(.medium)
                }
                    
            }
            .foregroundColor(.black)
        }
        .padding(.all, 20)
        .background(Color.white)
    }
}
