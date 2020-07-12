import SwiftUI

struct AssetList_Previews: PreviewProvider {
    static var previews: some View {
        AssetList(wallet: Wallet())
    }
}

let assetImage: [AssetType: String] = [
    AssetType.Cash: "dollarsign.square.fill",
    AssetType.Crypto: "bitcoinsign.square.fill",
    AssetType.Stock: "mail.fill"
]

struct AssetList: View {
    var wallet: Wallet
    
    var body: some View {
        List {
            ForEach(wallet.accounts, id: \.self) { account in
                Section(header: SectionView(account: account)) {
                    ForEach(account.assets, id: \.id) { asset in
                        switch asset.type {
                            case .Cash:
                                CashItem(asset: asset as! Cash)
                            case .Stock:
                                StockItem(asset: asset as! Stock)
                            case .Crypto:
                                CryptoItem(asset: asset as! Crypto)
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
    let account: Account
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text("\(account.name)")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top, 5)
                .textCase(.uppercase)
            Spacer()
            Text("$\(String(format: "%.2f", account.value))")
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
    let asset: Cash
    
    var body: some View {
        HStack {
            Group {
                Image(systemName: assetImage[asset.type]!)
                    .foregroundColor(.green)
                    .font(.largeTitle)
                Text("\(asset.currency)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Text("\(asset.name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                .padding(.trailing, 10)
                Spacer()
                Text("\(String(format: "%.2f", asset.value * asset.amount) )")
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
    let asset: Stock
    
    var body: some View {
        HStack {
            Group {
                Image(systemName: assetImage[asset.type]!)
                    .foregroundColor(.blue)
                    .font(.largeTitle)
                .padding(.trailing, 10)
                VStack(alignment: .leading) {
                    Text("\(String(format: "%.2f", asset.amount) )")
                        .font(.caption)
                        .fontWeight(.medium)
                    Text("$\(String(format: "%.2f", asset.cost / asset.amount) )")
                        .font(.caption2)
                        .fontWeight(.semibold)
                }
                .padding(.trailing, 10)
                Text("\(String(format: "%.2f", asset.value) )")
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.trailing, 10)
                VStack(alignment: .leading) {
                    Text("\(asset.ticker)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("\(asset.name)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(String(format: "%.2f", asset.amount * asset.value) )")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("\(String(format: "%.2f", asset.cost) )")
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
    let asset: Crypto
    
    var body: some View {
        HStack {
            Group {
                Image(systemName: assetImage[asset.type]!)
                    .foregroundColor(.yellow)
                    .font(.largeTitle)
                VStack(alignment: .leading) {
                    Text("\(String(format: "%.4f", asset.amount) )")
                        .font(.caption)
                        .fontWeight(.medium)
                    Text("$\(String(format: "%.2f", asset.cost / asset.amount) )")
                        .font(.caption2)
                        .fontWeight(.semibold)
                }
                .padding(.trailing, 10)
                Text("\(String(format: "%.2f", asset.value) )")
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.trailing, 10)
                VStack(alignment: .leading) {
                    Text("\(asset.currency)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("\(asset.name)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding(.trailing, 10)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(String(format: "%.2f", asset.amount * asset.value) )")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("\(String(format: "%.2f", asset.cost) )")
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
