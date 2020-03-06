import Foundation

//1. Придумать класс, методы которого могут создавать непоправимые ошибки.
//   Реализовать их с помощью try/catch.
enum DogCommandError: Error {
    case invalidCommand
    case noEnergy(energyNeeded: Int)
}

struct Command {
    let name: String
    let energyNeed: Int
}

class Dog {
    
    private(set) var commandList = [
        "Sit" : Command(name: "Sit", energyNeed: 1),
        "Down" : Command(name: "Down", energyNeed: 1),
        "Come" : Command(name: "Come", energyNeed: 2),
        "Fetch" : Command(name: "Fetch", energyNeed: 3),
        "Stop" : Command(name: "Stop", energyNeed: 1),
        "Stay" : Command(name: "Stay", energyNeed: 1)
    ]
    
    let name: String
    var energy: Int = 10
    
    func doCommand(commandName command: String) throws {
        guard let command = commandList[command] else { throw DogCommandError.invalidCommand }
        guard command.energyNeed <= energy else {
            throw DogCommandError.noEnergy(energyNeeded: command.energyNeed - energy)
        }
        energy -= command.energyNeed
        return print("Песель \(name) выполнил команду \(command.name)")
    }
    
    func learnCommand(commandName: String, energyNeed: Int) {
        commandList[commandName] = Command(name: commandName, energyNeed: energyNeed)
    }
    
    func giveYummy() {
        energy += 1
        print("Песель \(name) съел вкусняшку и восстановил энергию до \(energy)")
    }
    
    init(name: String) {
        self.name = name
    }
    
}

var dog1 = Dog(name: "Arnie")
try? dog1.doCommand(commandName: "Sit")
dog1.learnCommand(commandName: "Sleep", energyNeed: 0)
try? dog1.doCommand(commandName: "Sleep")
dog1.giveYummy()

dog1.energy = 0

do {
    try dog1.doCommand(commandName: "Heel")
} catch DogCommandError.invalidCommand {
    print("Песель \(dog1.name) не знает такой команды")
} catch DogCommandError.noEnergy(let energyNeeded) {
    print("Песелю \(dog1.name) не хватает энергии (\(energyNeeded)) для выполнения команды")
} catch {
    print(error.localizedDescription)
}

//2. Придумать класс, методы которого могут завершаться неудачей.
//   Реализовать их с использованием Error.
enum BankProductError: Error {
    case noMoney
    case invalidProduct
}

enum BankProductType: String {
    case deposit =  "вклад"
    case debitCard = "дебетовая карта"
    case credit = "кредит"
}

enum Currencies: String {
    case dollar = "доллар"
    case euro = "евро"
    case ruble = "рубль"
}

struct Money {
    let currency: Currencies
    var sum: Double
}

struct BankProduct {
    var productType: BankProductType
    var proc: Double
    var sum: Money
}

class BankAccount {
    
    private(set) var currentAccount = [
        "Debit Card 1" : BankProduct(productType: .debitCard, proc: 0, sum: Money(currency: .ruble, sum: 100000)),
        "Vklad 8 marta" : BankProduct(productType: .deposit, proc: 1, sum: Money(currency: .dollar, sum: 3000))
    ]
    
    var accountOwner: String
    
    init(accountOwner: String) {
        self.accountOwner = accountOwner
    }
    
    func withdraw(productName product: String, sum summa: Double) -> (Money?, BankProductError?) {
            guard var product = currentAccount[product] else {
                return (nil, BankProductError.invalidProduct)
            }
        guard product.sum.sum > summa else {
                return (nil, BankProductError.noMoney)
            }
        
        product.sum.sum -= summa
        print ("Вы успешно сняли деньги с \(product.productType.rawValue)")
        return (product.sum, nil)
    }
}

let newAccount = BankAccount(accountOwner: "Vasiliy")
let operation1 = newAccount.withdraw(productName: "Credit Card 1", sum: 1000)
let operation2 = newAccount.withdraw(productName: "Vklad 8 marta", sum: 3500)
let operation3 = newAccount.withdraw(productName: "Debit Card 1", sum: 3500)

if let result = operation1.0 {
    print("Текущий баланс счета: \(result.sum) в валюте \(result.currency.rawValue)")
} else if let error = operation1.1 {
    print("Произошла ошибка: \(error.localizedDescription)")
}
