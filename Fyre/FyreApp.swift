import SwiftUI

@main
struct FyreApp: App {
    @StateObject var wallet = Wallet()
        
    var body: some Scene {
        WindowGroup {
            HStack {
                if wallet.currentAsset != nil {
                    EditAssetView()
                        .environmentObject(wallet)
                }
                AssetListView()
                    .environmentObject(wallet)
            }
        }
    }
}
