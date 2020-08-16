import SwiftUI
import CoreData

@main
struct FyreApp: App {
    @StateObject var userData = UserData()
    @State private var showEdit = false
    @State private var isPresented = false
    @State private var currentSheet: ActiveSheet = .AddAccount
        
    var body: some Scene {
        WindowGroup {
            VStack {
                HStack {
                    Spacer()
                    Button("Add Account") {
                        currentSheet = .AddAccount
                        isPresented = true
                    }
                    Button("Add Asset") {
                        currentSheet = .AddAsset
                        isPresented = true
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .sheet(isPresented: $isPresented) {
                    if currentSheet == .AddAccount {
                        AddAccountView(isShowing: $isPresented)
                            .environmentObject(userData)
                    } else {
                        AddAssetView(isShowing: $isPresented)
                            .environmentObject(userData)
                    }
                }
                
                HStack {
                    AssetListView()
                        .environmentObject(userData)
                        .environment(\.managedObjectContext, userData.store.container.viewContext)
                }
                
            }
        }
    }
}
