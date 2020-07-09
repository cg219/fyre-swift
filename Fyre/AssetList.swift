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

func createStuff() -> Account {
    let cash = Cash("US Dollar")
    let stock = Stock("Apple Inc", 372.69, "AAPL")
    let crypto = Crypto("Bitcoin", 9248.45, "BTC")
    var account:Account = Account("Brokerage", .Brokerage)
    
    account.assets.append(cash)
    account.assets.append(stock)
    account.assets.append(crypto)
    
    return account
}

struct AssetList: View {
    var account = createStuff()
    var wallet: Wallet
    
    var body: some View {
        VStack {
            ForEach(wallet.accounts, id: \.self) { account in
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
            }
        }
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
