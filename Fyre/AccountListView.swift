import SwiftUI

struct AccountListView: View {
    var wallet:Wallet
    
    var body: some View {
        List {
            ForEach(wallet.wallet) { account in
                HStack {
                    Text(account.name)
                        .font(.largeTitle)
                        .padding(.horizontal, 10)
                    Spacer()
                    Text("\(account.value())")
                        .padding(.horizontal, 10)
                }
            }
        }
    }
}

struct AccountListView_Previews: PreviewProvider {
    static var previews: some View {
        AccountListView(wallet: testWallet)
    }
}
