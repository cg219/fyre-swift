import SwiftUI

struct AssetList_Previews: PreviewProvider {
    static var previews: some View {
        AssetList()
    }
}

let assetImage: [AssetType: String] = [
    AssetType.Cash: "dollarsign.square.fill",
    AssetType.Crypto: "bitcoinsign.square.fill",
    AssetType.Stock: "mail.fill"
]

struct AssetList: View {
    let cash = Cash("US Dollar")
    let stock = Stock("Apple Inc", 372.69, "AAPL")
    let crypto = Crypto("Bitcoin", 9248.45, "BTC")
    
    var body: some View {
        VStack {
            CashItem(asset: cash)
            StockItem(asset: stock)
            CryptoItem(asset: crypto)
        }
        
    }
}

struct CashItem: View {
    let asset:Cash
    let value = 19039.34
    
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
                Text("\(String(format: "%.2f", value) )")
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
    let asset:Stock
    let shares = 12.50
    let investment = 5000.00
    var basis =  5000 / 12.50
    
    var body: some View {
        HStack {
            Group {
                Image(systemName: assetImage[asset.type]!)
                    .foregroundColor(.blue)
                    .font(.largeTitle)
                .padding(.trailing, 10)
                VStack(alignment: .leading) {
                    Text("\(String(format: "%.2f", shares) )")
                        .font(.caption)
                        .fontWeight(.medium)
                    Text("$\(String(format: "%.2f", basis) )")
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
                    Text("\(String(format: "%.2f", shares * asset.value) )")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("\(String(format: "%.2f", investment) )")
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
    let asset:Crypto
    let amount = 0.1278
    let investment = 675.00
    var basis =  675 / 0.1278
    
    var body: some View {
        HStack {
            Group {
                Image(systemName: assetImage[asset.type]!)
                    .foregroundColor(.yellow)
                    .font(.largeTitle)
                VStack(alignment: .leading) {
                    Text("\(String(format: "%.4f", amount) )")
                        .font(.caption)
                        .fontWeight(.medium)
                    Text("$\(String(format: "%.2f", basis) )")
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
                    Text("\(String(format: "%.2f", amount * asset.value) )")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("\(String(format: "%.2f", investment) )")
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
