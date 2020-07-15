import SwiftUI

struct EditAssetView_Previews: PreviewProvider {
    static var previews: some View {
        EditAssetView()
            .environmentObject(Wallet())
    }
}

struct EditAssetView: View {
    @EnvironmentObject var wallet: Wallet
    
    var body: some View {
        switch  wallet.currentAsset!.type {
        case .Cash: return AnyView(EditCashView(cash: wallet.currentAsset as! Cash))
        case .Crypto: return AnyView(EditCryptoView(coin:  wallet.currentAsset as! Crypto))
        case .Stock: return AnyView(EditStockView(stock:  wallet.currentAsset as! Stock))
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
                    TextField("Amount", value: $cash.amount, formatter: NumberFormatter.currency)
                }
                Spacer()
            }
        }
    }
}
