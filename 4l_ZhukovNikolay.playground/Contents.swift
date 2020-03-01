import Foundation

//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
enum Action {
    case open, close
    case start, stop
    case on, off
    case full, empty
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

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
class Car {
    let manufactureYear: Int
    let color: String
    var engineState: Action
    var doorState: Action
    
    init(manufactureYear: Int,
         color: String,
         engineState: Action,
         doorState: Action) {
        self.manufactureYear = manufactureYear
        self.color = color
        self.engineState = engineState
        self.doorState = doorState
    }
    
    func Action(_ action: Action) {
        }
}

//2. Описать пару его наследников truckCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
class TruckCar: Car {
    let brand: TruckBrand
    let maxCapacity: Int
    let turningRadius: Int
    var bodyState: Action
    
    init(brand: TruckBrand,
         manufactureYear: Int,
         color: String,
         engineState: Action,
         doorState: Action,
         maxCapacity: Int,
         turningRadius: Int,
         bodyState: Action) {
        self.brand = brand
        self.maxCapacity = maxCapacity
        self.turningRadius = turningRadius
        self.bodyState = bodyState
        super.init(manufactureYear: manufactureYear, color: color, engineState: engineState, doorState: doorState)
    }

//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
    override func Action(_ action: Action) {
        if engineState == .stop {
            self.engineState = .start
        } else {
            self.engineState = .stop
        }
        if doorState == .close {
            self.doorState = .open
        } else {
            self.doorState = .close
        }
        if bodyState == .empty {
            self.bodyState = .full
        } else {
            self.bodyState = .empty
        }
    }
}


//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
class SportCar: Car {
    let brand: SportcarBrand
    let maxSpeed: Int
    var accelerator: Action
    
    init(brand: SportcarBrand,
         manufactureYear: Int,
         color: String,
         engineState: Action,
         doorState: Action,
         maxSpeed: Int,
         accelerator: Action) {
        self.brand = brand
        self.maxSpeed = maxSpeed
        self.accelerator = accelerator
        super.init(manufactureYear: manufactureYear, color: color, engineState: engineState, doorState: doorState)
    }

//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
    override func Action(_ action: Action) {
        if engineState == .stop {
            self.engineState = .start
        } else {
            self.engineState = .stop
        }
        if doorState == .close {
            self.doorState = .open
        } else {
            self.doorState = .close
        }
        if accelerator == .off {
            self.accelerator = .on
        } else {
            self.accelerator = .off
        }
    }
}

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
var sportcar1 = SportCar(brand: .am, manufactureYear: 2019, color: "White", engineState: .start, doorState: .close, maxSpeed: 300, accelerator: .on)
var sportcar2 = SportCar(brand: .bugatti, manufactureYear: 2020, color: "Red", engineState: .stop, doorState: .open, maxSpeed: 320, accelerator: .off)
var truckcar1 = TruckCar(brand: .man, manufactureYear: 2010, color: "Yellow", engineState: .start, doorState: .close, maxCapacity: 2000, turningRadius: 5500, bodyState: .empty)
var truckcar2 = TruckCar(brand: .kamaz, manufactureYear: 2013, color: "Black", engineState: .stop, doorState: .open, maxCapacity: 3000, turningRadius: 5200, bodyState: .full)

sportcar1.Action(.off)
sportcar2.Action(.close)
truckcar1.Action(.full)
truckcar2.Action(.start)

//6. Вывести значения свойств экземпляров в консоль
print(sportcar1.accelerator)
print(sportcar2.doorState)
print(truckcar1.bodyState)
print(truckcar2.engineState)
