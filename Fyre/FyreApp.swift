import SwiftUI

@main
struct FyreApp: App {
    @StateObject var userData = UserData()
    @State var showEdit = false
        
    var body: some Scene {
        WindowGroup {
            HStack {
                if showEdit {
                    EditAssetView(show: $showEdit)
                        .environmentObject(userData)
                }
                AssetListView(showEdit: $showEdit)
                    .environmentObject(userData)
            }
        }
    }
}
