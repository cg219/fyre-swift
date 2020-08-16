import Foundation

enum ActiveSheet {
    case AddAccount
    case AddAsset
}

public enum AccountType: String, CaseIterable, Equatable {
    case Savings = "Savings"
    case Checkings = "Checkings"
    case Retirement = "Retirement"
    case Brokerage = "Brokerage"
    case Digital = "Digital"
    case Lender = "Lender"
    case Property = "Property"
}

enum AssetType: String, CaseIterable, Equatable {
    case Stock = "Stock"
    case Cash = "Cash"
    case Crypto = "Crypto"
}

enum StockSector: String, CaseIterable, Equatable {
    case Financials = "Financials"
    case Utils = "Utilities"
    case Disc = "Consumer Discretionary"
    case Staples = "Consumer Staples"
    case Energy = "Energy"
    case Health = "Health Care"
    case Industrials = "Industrials"
    case Tech = "Technology"
    case Tele = "Telecom"
    case Mats = "Materials"
    case Estate = "Real Estate"
    case Other = "Other"
    case None = "None"
}
