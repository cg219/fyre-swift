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
        let amount = Binding<Double>(
            get: {
                return wallet.currentAsset!.amount
            },
            set: {
                wallet.currentAsset!.amount = $0
            }
        )
        
        return VStack {
            Text(wallet.currentAsset!.code)
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.top, 10)
                .padding(.bottom, 5)
            Text(wallet.currentAsset!.name)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .textCase(.uppercase)
            HStack {
                Spacer()
                VStack {
                    Text("# of Shares")
                        .font(.caption)
                    TextField("Amount", value: amount, formatter: NumberFormatter.double)
                }
                Spacer()
            }
        }
    }
}
