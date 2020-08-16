let savings = Account("Ally Savings", .Savings)
let brokerage = Account("Fidelity Regular", .Brokerage)
let digital = Account("Crypto Wallet", .Digital)
let roth = Account("Roth IRA", .Retirement)

let account1:[Asset] = [
    Asset("Apple Inc", 372.69, "AAPL", 3000, 12, .Tech),
    Asset("Tesla", 1372.69, "TSLA", 3000, 4, .Tech),
    Asset("Facebook", 1372.69, "FB", 3000, 19, .Tele),
    Asset("US Dollar", 233)
]

let account2:[Asset] = [
    Asset("Facebook", 1372.69, "FB", 1372.69, 1, .Tele),
    Asset("US Dollar", 4312)
]

let account3:[Asset] = [
    Asset("Bitcoin", 9248.45, "BTC", 1000, 0.12),
    Asset("Litecoin", 43.45, "LTC", 1300, 20),
    Asset("Bitcoin Cash", 234.43, "BCH", 500, 2)
]

let account4:[Asset] = [
    Asset("US Dollar", 19320)
]
