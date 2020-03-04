import UIKit

//Типы ценных бумаг
enum SecurityType: String {
    case bond = "Облигация"
    case share = "Акция"
}

//Общие свойства ценных бумаг
protocol Security: CustomStringConvertible{
    
    var cost: Double { get }
    var tickerSymbol: String { get }
    var type: SecurityType { get }
    
}

extension Security {
    var description: String {
        "\(type.rawValue) с тикером: \(tickerSymbol) и ценой покупки: \(cost)"
    }
}

//Акции
struct Share: Security {
    
    let type: SecurityType = .share
    var cost: Double
    var tickerSymbol: String
    var currentDividend: Double
}

//Облигации
struct Bond: Security {

    let type: SecurityType = .bond
    var cost: Double
    var tickerSymbol: String
    var bondValue: Double
    var bondCoupon: Double
    
}

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
typealias tickerPrice = (Double) -> Bool

struct Queue<T: Security> {
    
    private var elements: [T] = []

    mutating func push(_ element: T) {
        elements.append(element)
        print("\(element.type.rawValue) с тикером \(element.tickerSymbol) и ценой покупки: \(element.cost) куплена")
    }
    
    mutating func pop() -> T? {
        guard elements.isEmpty == false else { return nil }
        print("\(elements[0].type.rawValue) с тикером \(elements[0].tickerSymbol) и ценой покупки: \(elements[0].cost) продана")
        return elements.removeFirst()
    }
    
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции
//   (пример: filter для массивов)
    func profitability(ticker: String, price: tickerPrice) -> String {
        var num: Double = 0
        var sum: Double = 0
        var mean: Double = 0
        for element in elements {
            if ticker == element.tickerSymbol {
                num += 1
                sum += element.cost
            }
        }
        mean = sum / num
        if price(mean) {
            return "Покупка выгоднее средней цены \(mean) приобретения \(ticker)"
        } else {
            return "Покупка менее выгодна средней цены \(mean) приобретения \(ticker)"
        }
    }
}

var sharesQueue = Queue<Share>()
sharesQueue.push(Share(cost: 299.51, tickerSymbol: "AAPL", currentDividend: 0.77))
sharesQueue.push(Share(cost: 40.6, tickerSymbol: "YNDX", currentDividend: 0))
sharesQueue.push(Share(cost: 301.10, tickerSymbol: "AAPL", currentDividend: 0.77))
print(sharesQueue.profitability(ticker: "AAPL") {$0 > 300})
sharesQueue.pop()
