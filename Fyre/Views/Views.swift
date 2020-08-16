import SwiftUI

struct AssetListView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            ForEach(userData.accounts, id: \.self) { account in
                Section(header: SectionView(account: account, userData: userData)) {
                    VStack {
                        ForEach(account.assets, id: \.self) { asset in
                            switch asset.type {
                                case .Cash:
                                    CashItem(asset: asset)
                                        .onTapGesture {
                                            sendAssets(asset, account, userData)
                                        }
                                case .Stock:
                                    StockItem(asset: asset)
                                        .onTapGesture {
                                            sendAssets(asset, account, userData)
                                        }
                                case .Crypto:
                                    CryptoItem(asset: asset)
                                        .onTapGesture {
                                            sendAssets(asset, account, userData)
                                        }
                            }
                        }
                        .cornerRadius(10)
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct EditAssetView: View {
    @EnvironmentObject var userData: UserData
    @Binding var show: Bool
    
    var body: some View {
        let asset: Asset = userData.accounts[userData.edited.0].assets[userData.edited.1]
        let amount: Binding<Double> = $userData.accounts[userData.edited.0].assets[userData.edited.1].amount
        let header: String = asset.type == AssetType.Stock ? "# of Shares" : "Amount"
        
        return VStack {
            Text(asset.code)
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.top, 10)
                .padding(.bottom, 5)
            Text(asset.name)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .textCase(.uppercase)
            HStack {
                Spacer()
                VStack {
                    Text(header)
                        .font(.caption)
                    TextField("", value: amount, formatter: NumberFormatter.normal, onEditingChanged: { _ in }) {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            show = false
                        }
                    }
                }
                Spacer()
            }
            .frame(maxWidth: 200, maxHeight: .infinity)
        }
    }
}

