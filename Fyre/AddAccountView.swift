import SwiftUI

struct NewAccount {
    var name: String = ""
    var type: AccountType = .Savings
}

struct AddAccountView: View {
    @Binding var isShowing: Bool
    @State var account: NewAccount = NewAccount()
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Add Account")
                Spacer()
            }
            TextField("Account Name", text: $account.name)
            Picker("Account Type", selection: $account.type) {
                ForEach(AccountType.allCases, id: \.self) { type in
                    Text(type.rawValue)
                        .tag(type)
                }
            }
            HStack {
                Spacer()
                Button("Cancel") {
                    isShowing = false
                }
                Button("Add") {
                    userData.addAccount(account: account)
                    isShowing = false
                }
                Spacer()
            }
        }
        .frame(width: 300, height: 100, alignment: .center)
        .padding(20)
    }
}
