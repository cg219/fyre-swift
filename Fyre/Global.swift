let assetImage: [AssetType: String] = [
    AssetType.Cash: "dollarsign.square.fill",
    AssetType.Crypto: "bitcoinsign.square.fill",
    AssetType.Stock: "mail.fill"
]

func sendAssets(_ asset: Asset, _ account: Account, _ userData: UserData) {
    let accountIndex: Int = userData.accounts.firstIndex(where: { $0.id == account.id })!
    let assetIndex: Int = userData.accounts[accountIndex].assets.firstIndex(where: { $0.id == asset.id})!
    
    userData.edited = (accountIndex, assetIndex)
}
