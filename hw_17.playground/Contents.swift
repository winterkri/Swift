//ДЗ 17 - ARC - automatic reference counter
//
//Описать несколько структур – любой легковой автомобиль и любой грузовик
//Структуры должны содержать марку авто (можно через enum 5-6 марок автомобилей сделать), год выпуска, объем багажника / кузова, запущен ли двигатель

// Перечисление для марок автомобилей
enum Cars {
    case Porche
    case Dodge
    case BMW
    case Tesla
    case Kamaz
}

//Описать перечисление с возможными действиями с автомобилем: запустить/заглушить, двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
enum Actions {
       case startEngine
       case stopEngine
       case openWindow
       case closeWindow
       case loadCargo(volume: Double)
       case unloadCargo(volume: Double)
}
struct Car: Hashable {
    let brand: Cars
    let year: Int
    var isStarted: Bool
    var isOpenedWindows: Bool
    var isLoad: Bool
    
//Добавить в структуры метод с одним аргументом типа enum, который будет менять свойства структуры в зависимости от действия (То есть будут меняться состояния машины: едет (значит двигатель запущен), стоит на месте, и тд).

    mutating func changeProperty (argument: Actions) {
        switch argument {
        case .startEngine:
            print("Машина едет")
            isStarted = true
        case .stopEngine:
            print("Машина стоит на месте")
            isStarted = false
        case .openWindow:
            print("У машины открыты окна")
            isOpenedWindows = true
        case .closeWindow:
            print("У машины закрыты окна")
            isOpenedWindows = false
        case .loadCargo(volume: let volume):
            print("В машину погружены сумки весом: \(volume)")
            isLoad = true
        case .unloadCargo(volume: let volume):
            print("Из машины выгружены сумки весом: \(volume)")
            isLoad = false
        }
    }
}

struct Truck: Hashable {
    let brand: Cars
    let year: Int
    let volume: Double
    var isStarted: Bool
    var isOpenedWindows: Bool
    var isLoad: Bool
    
//Добавить в структуры метод с одним аргументом типа enum, который будет менять свойства структуры в зависимости от действия (То есть будут меняться состояния машины: едет (значит двигатель запущен), стоит на месте, и тд).
    
    mutating func changeProperty (argument: Actions) {
        switch argument {
        case .startEngine: //если ргумент соответствует значению startEngine, то
            print("Машина едет") //печатаем, что наша машина на ходу
            isStarted = true //и меняем свойствой isStarted на true
        case .stopEngine:
            print("Машина не едет")
            isStarted = false
        case .openWindow:
            print("У машины открыты окна")
            isOpenedWindows = true
        case .closeWindow:
            print("У машины закрыты окна")
            isOpenedWindows = false
        case .loadCargo(volume: let volume):
            print("В машину погружены сумки весом: \(volume)")
            isLoad = true
        case .unloadCargo(volume: let volume):
            print("Из машины выгружены сумки весом: \(volume)")
            isLoad = false
        }
    }
}

//Инициализировать несколько экземпляров структур. Применить к ним различные действия
// Инициализируем экземпляр легкового автомобиля
var myCar = Car(brand: .Dodge, year: 2024, isStarted: false, isOpenedWindows: true, isLoad: false)

// Применяем метод changeProperty к myCar для запуска двигателя
myCar.changeProperty(argument: .startEngine)
// Применяем метод changeProperty к myCar для закрытия оконо
myCar.changeProperty(argument: .closeWindow)
print(myCar)

//Применяаем метод changeProperty к myTruck
// Инициализируем экземпляр грузового автомобиля
var myTruck = Truck(brand: .Kamaz, year: 2010, volume: 34, isStarted: true, isOpenedWindows: false, isLoad: true)

// Применяем метод changeProperty к myTruck для выключения двигателя
myTruck.changeProperty(argument: .stopEngine)
// Применяем метод changeProperty к myTruck для разгрузки камаза
myTruck.changeProperty(argument: .unloadCargo(volume: 34))
print(myTruck)


//Положить объекты структур в словарь, как ключи, а их названия как строки например

// Создаем словарь, где ключи - экземпляры структур, а значения - названия марок
//AnyHashable — это обобщенный тип, который может содержать любые значения, которые соответствуют протоколу Hashable. Этот протокол требуется для того, чтобы объект мог быть использован в качестве ключа в словаре. В данном случае, это позволяет использовать экземпляры структур Car и Truck в качестве ключей.
var dict = [AnyHashable: String]()
// Добавляем в словарь объект myCar и марку
dict[myCar] = "\(Cars.Dodge)"
// Добавляем в словарь объект myTruck и марку
dict[myTruck] = "\(Cars.Kamaz)"
print(dict)

//Печатаем ключи и значение отдельно
print(dict.keys)
print(dict.values)



//
print(myCar.hashValue)



//Задание: Управление умным домом

//Создайте программу для управления устройствами умного дома. Ваша задача — описать структуры для двух типов устройств: лампа (освещение) и кондиционер (климат-контроль). Каждое устройство должно иметь свои уникальные свойства и поддерживать действия, связанные с его управлением.
//
//Требования:
//
//    1.    Перечисление типов устройств:
//    •    Создайте enum с несколькими типами устройств, например, Lamp, AirConditioner, Fan, Heater.

enum Devices {
    case Lamp
    case Conditioner
    case Fan
    case Heater
}


//    2.    Перечисление действий:
//    •    Опишите enum с возможными действиями для управления устройствами. Действия могут включать:
//    •    turnOn: включить устройство,
//    •    turnOff: выключить устройство,
//    •    setBrightness(level: Int): установить уровень яркости (только для лампы),
//    •    setTemperature(degrees: Double): установить температуру (только для кондиционера).

enum ActionsForHome {
    case turnOn
    case turnOff
    case setBrightness(level: Double)
    case setTemperature(degrees: Double)
}

//    3.    Структура для лампы:
//    •    Создайте структуру Lamp, содержащую:
//    •    тип устройства (используйте ваше перечисление),
//    •    мощность лампы (в ваттах),
//    •    текущее состояние (включено или выключено),
//    •    текущий уровень яркости (число от 0 до 100).
//    •    Добавьте метод performAction, который принимает действие и меняет состояние лампы в зависимости от действия.

struct Lamp: Hashable {
    var type: Devices
    var power: Int
    var isOn: Bool
    var isLevelBrightness: Double
    
    mutating func performAction(action: ActionsForHome) {
            switch action {
            case .turnOn:
                isOn = true
            case .turnOff:
                isOn = false
            case .setBrightness(level: let level):
                isLevelBrightness = level
            default:
                print("Error")
            }
        }
    }

//    4.    Структура для кондиционера:
//    •    Создайте структуру AirConditioner, содержащую:
//    •    тип устройства (используйте ваше перечисление),
//    •    мощность кондиционера (в кВт),
//    •    текущее состояние (включено или выключено),
//    •    текущую температуру.
//    •    Добавьте метод performAction, который принимает действие и меняет состояние кондиционера в зависимости от действия.

struct AirConditioner: Hashable {
    var type: Devices
    var power: Int
    var isOn: Bool
    var temperature: Double
    
    mutating func performAction(action: ActionsForHome) {
        switch action {
        case .turnOn:
            isOn = true
        case .turnOff:
            isOn = false
        case .setTemperature(degrees: let degrees):
            temperature = degrees
        default:
            print("Error")
        }
    }
}


//    5.    Инициализация и работа с устройствами:
//    •    Инициализируйте объекты Lamp и AirConditioner с начальными значениями.
//    •    Примените к ним несколько действий, чтобы изменить их состояние (например, включите лампу, установите яркость, включите кондиционер и установите температуру).

var myLamp = Lamp(type: .Lamp, power: 100, isOn: false, isLevelBrightness: 50.4)
print(myLamp)
myLamp.performAction(action: .turnOn)
print(myLamp)

var myConditioner = AirConditioner(type: .Conditioner, power: 2000, isOn: true, temperature: 24.0)
print(myConditioner)
myConditioner.performAction(action: .turnOff)
myConditioner.temperature = 30
print(myConditioner)

////    6.    Создание словаря для хранения устройств:
////    •    Создайте словарь, где ключами будут ваши устройства, а значениями — их описания (например, “Лампа в спальне”, “Кондиционер в гостиной”).

// Создаем словарь, где ключами будут устройства, а значениями — их описания
var deviceDescriptions: [AnyHashable: String] = [:]

// Добавляем устройства в словарь с описаниями
deviceDescriptions[myLamp] = "Лампа в спальне"
deviceDescriptions[myConditioner] = "Кондиционер в гостиной"

// Выводим словарь на экран
print(deviceDescriptions)

//Другое
//
//var dict2: [Devices:AnyHashable] = [:]
//
//dict2[.Lamp] = myLamp
//dict2[.Conditioner] = myConditioner
//
//print(dict2)
