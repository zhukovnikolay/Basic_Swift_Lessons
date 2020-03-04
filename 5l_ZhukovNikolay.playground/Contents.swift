import UIKit

enum windowsStates: String {
    case open = "окна открыты"
    case close = "окна закрыты"
}

enum engineStates: String {
    case start = "двигатель запущен"
    case stop = "двигатель заглушен"
}

//задаем бренды спортивных автомобилей
enum SportcarBrand: String {
    case am = "Aston Martin"
    case bugatti = "Bugatti"
    case porsche = "Porsche"
    case ferrari = "Ferrari"
}

//задаем бренды грузовиков
enum TruckBrand: String {
    case man = "MAN"
    case volvo = "Volvo"
    case kamaz = "KAMAZ"
    case renault = "Renault"
}

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
protocol Car {
    var manufactureYear: Int { get }
    var color: UIColor { get }
    var engineState: engineStates { get set }
    var windowsState: windowsStates { get set }
    mutating func changeWindowsState()
    mutating func changeEngineState()
}

//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с
//   автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на
//   действие, реализовывать следует только те действия, реализация которых общая для всех
//   автомобилей).
extension Car {
    mutating func changeWindowsState() {
        if windowsState == .close {
            self.windowsState = .open
        } else {
            self.windowsState = .close
        }
    }
    mutating func changeEngineState() {
        if engineState == .stop {
            self.engineState = .start
        } else {
            self.engineState = .stop
        }
    }
}

//3. Создать два класса, имплементирующих протокол «Car» - truckCar и sportСar.
//   Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
class TruckCar: Car {
    let brand: TruckBrand
    var manufactureYear: Int
    var color: UIColor
    var engineState: engineStates
    var windowsState: windowsStates
    let maxCapacity: Int
    let turningRadius: Int

    init(brand: TruckBrand,
     manufactureYear: Int,
     color: UIColor,
     engineState: engineStates,
     windowsState: windowsStates,
     maxCapacity: Int,
     turningRadius: Int) {
        self.brand = brand
        self.manufactureYear = manufactureYear
        self.color = color
        self.engineState = engineState
        self.windowsState = windowsState
        self.maxCapacity = maxCapacity
        self.turningRadius = turningRadius
    }
}

class SportCar: Car {
    let brand: SportcarBrand
    var manufactureYear: Int
    var color: UIColor
    var engineState: engineStates
    var windowsState: windowsStates
    let maxSpeed: Int

    init(brand: SportcarBrand,
     manufactureYear: Int,
     color: UIColor,
     engineState: engineStates,
     windowsState: windowsStates,
     maxSpeed: Int) {
        self.brand = brand
        self.manufactureYear = manufactureYear
        self.color = color
        self.engineState = engineState
        self.windowsState = windowsState
        self.maxSpeed = maxSpeed
    }
}
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension SportCar: CustomStringConvertible {
    var description: String {
        "Спортивный автомобиль марки \(self.brand.rawValue), \(self.manufactureYear) года выпуска, с максимальной скоростью: \(self.maxSpeed) км/ч, \(self.engineState.rawValue), \(self.windowsState.rawValue)"
    }
}

extension TruckCar: CustomStringConvertible {
    var description: String {
        "Грузовой автомобиль марки \(self.brand.rawValue), \(self.manufactureYear) года выпуска, с максимальной грузоподъемностью: \(self.maxCapacity) кг, \(self.engineState.rawValue), \(self.windowsState.rawValue)"
    }
}

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
var truckCar1 = TruckCar(brand: .kamaz, manufactureYear: 2020, color: .brown, engineState: .stop, windowsState: .close, maxCapacity: 2000, turningRadius: 5500)
var truckCar2 = TruckCar(brand: .man, manufactureYear: 2015, color: .darkGray, engineState: .start, windowsState: .open, maxCapacity: 3200, turningRadius: 4000)
var sportCar1 = SportCar(brand: .am, manufactureYear: 2020, color: .blue, engineState: .start, windowsState: .open, maxSpeed: 300)
var sportCar2 = SportCar(brand: .bugatti, manufactureYear: 2019, color: .red, engineState: .stop, windowsState: .open, maxSpeed: 290)
truckCar1.changeEngineState()
truckCar2.changeWindowsState()
sportCar1.changeWindowsState()
sportCar2.changeEngineState()

//6. Вывести сами объекты в консоль.
print(truckCar1)
print(truckCar2)
print(sportCar1)
print(sportCar2)
