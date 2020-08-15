import SwiftUI
import CoreData

@main
struct FyreApp: App {
    @StateObject var userData = UserData()
    @State private var showEdit = false
    @State private var isPresented = false
        
    var body: some Scene {
        WindowGroup {
            VStack {
                HStack {
                    Spacer()
                    Button("Add Account") {
                        self.isPresented = true
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                
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
            .sheet(isPresented: $isPresented) {
                AddAccountView(isShowing: $isPresented)
                    .environmentObject(userData)
            }
        }
    }
}
