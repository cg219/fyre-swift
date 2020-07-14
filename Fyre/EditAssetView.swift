import SwiftUI

struct EditAssetView: View {
    @State var asset: Asset = account4[0]
    
    var body: some View {
        HStack {
            switch asset.type {
            case .Cash:
                EditCashView(cash: asset as! Cash)
            case .Crypto:
                EditCryptoView(coin: asset as! Crypto)
            case .Stock:
                EditStockView(stock: asset as! Stock)
            }
        }
    }
}

struct EditCryptoView: View {
    @State var coin: Crypto
    
    var body: some View {
        VStack {
            Text(coin.currency)
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.top, 10)
                .padding(.bottom, 5)
            Text(coin.name)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .textCase(.uppercase)
            HStack {
                Spacer()
                VStack {
                    Text("# of Coins")
                        .font(.caption)
                    TextField("Amount", value: $coin.amount, formatter: NumberFormatter.double)
                }
                Spacer()
            }
        }
    }
}

struct EditStockView: View {
    @State var stock: Stock
    
    var body: some View {
        VStack {
            Text(stock.ticker)
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.top, 10)
                .padding(.bottom, 5)
            Text(stock.name)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .textCase(.uppercase)
            HStack {
                Spacer()
                VStack {
                    Text("# of Shares")
                        .font(.caption)
                    TextField("Amount", value: $stock.amount, formatter: NumberFormatter.double)
                }
                Spacer()
            }
        }
    }
}

struct EditCashView: View {
    @State var cash: Cash
    
    var body: some View {
        VStack {
            Text(cash.currency)
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.top, 10)
                .padding(.bottom, 5)
            Text(cash.name)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .textCase(.uppercase)
            HStack {
                Spacer()
                VStack {
                    Text("Amount")
                        .font(.caption)
                    TextField("Amount", value: $cash.amount, formatter: NumberFormatter.double)
                }
                Spacer()
            }
        }
    }
}

struct EditAssetView_Previews: PreviewProvider {
    static var previews: some View {
        EditAssetView()
    }
}
