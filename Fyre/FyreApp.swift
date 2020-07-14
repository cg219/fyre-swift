import SwiftUI

@main
struct FyreApp: App {
    @StateObject var wallet = Wallet()
        
    var body: some Scene {
        WindowGroup {
            AssetListView()
                .environmentObject(wallet)
        }
    }
}
