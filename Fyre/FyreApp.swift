import SwiftUI
import CoreData

@main
struct FyreApp: App {
    @StateObject var userData = UserData()
    @State var showEdit = false
        
    var body: some Scene {
        WindowGroup {
            VStack {
                HStack {
                    Text("Add Account")
                    Button(action: userData.addAccount) {
                        Image(systemName: "plus.app.fill")
                    }
                }
                HStack {
                    if showEdit {
                        EditAssetView(show: $showEdit)
                            .environmentObject(userData)
                    }
                    AssetListView(showEdit: $showEdit)
                        .environmentObject(userData)
                        .environment(\.managedObjectContext, userData.store.container.viewContext)
                }
                
            }
        }
    }
}
