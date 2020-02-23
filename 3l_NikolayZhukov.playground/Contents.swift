import Foundation

//задаем бренды легковушек
enum CarBrand: String {
    case hyundai = "Hyundai"
    case kia = "Kia"
    case toyota = "Toyota"
    case vw = "Volkswagen"
    case lada = "Lada"
    case nissan = "Nissan"
    case skoda = "Skoda"
}

//задаем бренды грузовиков
enum TruckBrand: String {
    case man = "MAN"
    case volvo = "Volvo"
    case kamaz = "KAMAZ"
    case renault = "Renault"
}

//задаем состояния двигателя
enum EngineState {
    case start, stop
}

//задаем статус окон
enum WindowsState {
    case open, closed
}

//задаем структуру легковушки
struct Car {
    var brand: CarBrand
    var manufactureYear: Int
    var color: String
//формируем метод с перечислением, меняющим цвет автомобиля
    mutating func changeColor(_ color:String) {
        switch color {
        case "black":
            self.color = "black"
        case "gray":
            self.color = "gray"
        case "blue":
            self.color = "blue"
        default:
            print("Выбранного Вами цвета не существует для этой марки. Будет выбран белый цвет")
            self.color = "white"
        }
    }
    var trunkVolume: Double
//задаем и отслеживаем статус двигателя
    var engine: EngineState {
        willSet {
            if newValue == .start {
                print("Двигатель \(brand.rawValue) будет включен")
            } else {
                print("Двигатель \(brand.rawValue) будет заглушен")
            }
        }
    }
//задаем и отслеживаем статус окон
    var windows: WindowsState {
        willSet {
            if newValue == .open {
                print("Окна \(brand.rawValue) будут открыты")
            } else {
                print("Окна \(brand.rawValue) будут закрыты")
            }
        }
    }
//задаем и отслеживаем статус загрузки багажника
    var usedTrunkVolume: Double {
        willSet {
            if newValue > self.usedTrunkVolume {
                print("После погрузки груза в багажнике \(brand.rawValue) будет занято \(newValue) из \(trunkVolume)")
            } else {
                print("После разгрузки груза в багажнике \(brand.rawValue) будет занято \(newValue) из \(trunkVolume)")
            }
        }
    }
    
//создаем метод, меняющий статус двигателя
    mutating func changeEngineState() {
        if engine == .stop {
            self.engine = .start
        } else {
            self.engine = .stop
        }
    }

//создаем метод, меняющий статус окон
    mutating func changeWindowsState() {
        if windows == .open {
            self.windows = .closed
        } else {
            self.windows = .open
        }
    }

//создаем метод по загрузке (с положительными значениями) или разгрузке (с отрицательными) багажника
    mutating func trunkLoad(_ cargoWeight: Double) {
        if (cargoWeight <= trunkVolume - usedTrunkVolume) && (cargoWeight >= 0) {
            self.usedTrunkVolume += cargoWeight
        } else if (abs(cargoWeight) > usedTrunkVolume) && (cargoWeight < 0) {
            print("В багажнике занято меньше места (\(usedTrunkVolume)), чем Вы пытаетесь разгрузить (\(abs(cargoWeight)))")
        } else if (abs(cargoWeight) <= usedTrunkVolume) && (cargoWeight < 0) {
            self.usedTrunkVolume += cargoWeight
        } else {
            print("Вес груза (\(cargoWeight)) больше свободного места в багажнике: \(self.trunkVolume - self.usedTrunkVolume)")
        }
    }
}

//почти все аналогично легковушке (кроме бренда и кузова вместо багажника в описаниях)
struct Truck {
    var brand: TruckBrand
    var manufactureYear: Int
    var color: String
    mutating func changeColor(_ color:String) {
        switch color {
        case "black":
            self.color = "black"
        case "gray":
            self.color = "gray"
        case "blue":
            self.color = "blue"
        default:
            print("Выбранного Вами цвета не существует для этой марки. Будет выбран белый цвет")
            self.color = "white"
        }
    }
    var bodyVolume: Double
    var engine: EngineState {
        willSet {
            if newValue == .start {
                print("Двигатель \(brand.rawValue) будет включен")
            } else {
                print("Двигатель \(brand.rawValue) будет заглушен")
            }
        }
    }
    var windows: WindowsState {
        willSet {
            if newValue == .open {
                print("Окна \(brand.rawValue) будут открыты")
            } else {
                print("Окна \(brand.rawValue) будут закрыты")
            }
        }
    }
    var usedBodyVolume: Double {
        willSet {
            if newValue > self.usedBodyVolume {
                print("После погрузки груза в кузове \(brand.rawValue) будет занято \(newValue) из \(bodyVolume)")
            } else {
                print("После разгрузки груза в кузове \(brand.rawValue) будет занято \(newValue) из \(bodyVolume)")
            }
        }
    }
    
    mutating func changeEngineState() {
        if engine == .stop {
            self.engine = .start
        } else {
            self.engine = .stop
        }
    }
    
    mutating func changeWindowsState() {
        if windows == .open {
            self.windows = .closed
        } else {
            self.windows = .open
        }
    }
    
    mutating func bodyLoad(_ cargoWeight: Double) {
        if (cargoWeight <= bodyVolume - usedBodyVolume) && (cargoWeight >= 0) {
            self.usedBodyVolume += cargoWeight
        } else if (abs(cargoWeight) > usedBodyVolume) && (cargoWeight < 0) {
            print("В кузове занято меньше места (\(usedBodyVolume)), чем Вы пытаетесь разгрузить (\(abs(cargoWeight)))")
        } else if (abs(cargoWeight) <= usedBodyVolume) && (cargoWeight < 0) {
            self.usedBodyVolume += cargoWeight
        } else {
            print("Вес груза (\(cargoWeight)) больше свободного места в кузове: \(self.bodyVolume - self.usedBodyVolume)")
        }
    }
}


var car1 = Car(brand: .toyota, manufactureYear: 2019, color: "red", trunkVolume: 200, engine: .stop, windows: .closed, usedTrunkVolume: 120)
car1.changeColor("black")
car1.trunkLoad(30)
car1.trunkLoad(-180)
car1.trunkLoad(-50)
print(car1)

var car2 = Car(brand: .lada, manufactureYear: 2003, color: "wet asphalt", trunkVolume: 150, engine: .start, windows: .open, usedTrunkVolume: 0)
car2.changeWindowsState()
print(car2)

var truck1 = Truck(brand: .man, manufactureYear: 2008, color: "gray", bodyVolume: 3000, engine: .stop, windows: .open, usedBodyVolume: 1800)
truck1.usedBodyVolume = 1000
truck1.changeEngineState()
print(truck1)

var truck2 = Truck(brand: .kamaz, manufactureYear: 2015, color: "orange", bodyVolume: 2500, engine: .stop, windows: .closed, usedBodyVolume: 500)
truck2.changeColor("incorrect")
truck2.bodyLoad(1500)
print(truck2)
