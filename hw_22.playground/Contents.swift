import Foundation

//ДЗ 22 - Protocol / Протоколо-ориентированное программирование
/*
 Copy on Write (COW) в Swift — это механизм, который помогает эффективно работать с данными, копируя их только тогда, когда это действительно необходимо. Этот подход особенно полезен при работе с коллекциями, такими как массивы, строки и словари.

Протокол - это набор методов и свойств без реализаций
 */

//(Со звездочкой) Почитать про copy on write и понять что это такое - https://www.youtube.com/watch?v=66g_pD3s7TY
//(Со звездочкой) Реализовать структуру IOSCollection и создать в ней copy on write по типу - https://www.youtube.com/watch?v=QsoqHGgX2rE&t=594s
// Класс для обёртки данных, чтобы сделать их ссылочными

class Link<T> {
    var value: T // само значение
    init(_ value: T) {
        self.value = value
    }
}

// Структура с Copy-On-Write
struct IOSCollection<T> {
    private var link: Link<T> //переменная, которая содержит объект класса Link
    
    // Инициализация структуры
    init(value: T) {
        self.link = Link(value)
    }
    
    // Доступ к значению
    var value: T {
        get {
            link.value // Возвращаем значение
        }
        set {
            // Если на объект ссылается только текущая структура, меняем значение
            if !isKnownUniquelyReferenced(&link) {
                link = Link(newValue) // Создаём новый объект, чтобы не затронуть другие структуры - это одно и то же что let obj = Link()
            } else {
                link.value = newValue // Изменяем значение в текущем объекте, тут просто устанавливаем новое значение в value
            }
        }
    }
}

// Пример использования
var kek = IOSCollection(value: 10)
var kek2 = kek
print(kek.value)

print(kek2.value)



kek2.value = 20
print(kek.value)
print(kek2.value)
//Честно говоря, сложно далось осознание этого

//Создать протокол Hotel с инициализатором который принимает roomCount, после создать class HotelAlfa добавить свойство roomCount и подписаться на этот протокол

protocol Hotel {
    var roomCount: Int { get }
}

class HotelAlfa: Hotel {
    var roomCount: Int
    
    init(roomCount: Int) {
        self.roomCount = roomCount
    }
}


//Создать protocol GameDice у него {get} свойство numberDice далее нужно расширить Int так чтобы, когда мы напишем такую конструкцию "let diceCoub = 4 \n diceCoub.numberDice" в консоле мы увидели такую строку - "Выпало 4 на кубике"

protocol GameDice {
    var numberDice: Int { get }
}

extension Int: GameDice {
    var numberDice: Int {
        print("Выпало \(self) на кубике")
        return self
    }
}

let diceCoub = 4
print(diceCoub.numberDice) // Вывод: Выпало 4 на кубике

//Создать протокол с одним методом и 2мя свойствами одно из них сделать явно optional, создать класс, подписать на протокол и реализовать только 1 обязательное свойство

protocol myProtocol {
    var myProperty: Int { get }
    var myProperty2: String? { get }
    func myMethod()
}

extension myProtocol {
    var myProperty2: String? { return nil }
}

class myClass: myProtocol {
    var myProperty: Int
    func myMethod() {}
    
    init(myProperty: Int) {
        self.myProperty = myProperty
    }
}

let myObject = myClass(myProperty: 10)
myObject.myProperty2
myObject.myProperty



////Вот задание для уровня Джун, чтобы потренироваться с классами, протоколами и расширениями.
//
//Задание: “Система управления транспортом”
//
//1. Создайте протоколы
//
//    •    Протокол Transportable с требованиями:
//    •    Свойство speed (тип Int, скорость транспорта).
//    •    Метод move() (возвращает строку с описанием движения транспорта).
//    •    Протокол PassengerCarrying (для транспорта, который перевозит пассажиров):
//    •    Свойство passengerCapacity (тип Int, вместимость пассажиров).
//

protocol Transportable {
    var speed: Int { get }
    func move() -> String
}

protocol PassengerCarrying {
    var passengerCapacity: Int { get }
}

//2. Создайте базовый класс
//
//Создайте класс Transport:
//    •    Общие свойства:
//    •    name (название транспорта, строка).
//    •    speed (реализует из протокола Transportable).
//    •    Инициализатор для установки имени и скорости.
//    •    Реализуйте метод move(), который возвращает строку вида:
//"\(name) движется со скоростью \(speed) км/ч.".
//
class Transport: Transportable {
    var speed: Int
    let name: String
    
    func move() -> String {
        return "\(name) движется со скоростью \(speed) км/ч."
    }
    
    init(speed: Int, name: String) {
        self.speed = speed
        self.name = name
    }
    
}

//3. Создайте подклассы
//
//    1.    Car:
//    •    Реализует протоколы Transportable и PassengerCarrying.
//    •    Дополнительное свойство: fuelLevel (тип Int, уровень топлива).
//    •    Переопределите метод move(), добавив информацию об уровне топлива.
//Например:
//"Машина \(name) движется со скоростью \(speed) км/ч. Топливо: \(fuelLevel)%."

class Car: Transport, PassengerCarrying {
    var passengerCapacity: Int
    var fuelLevel: Int
    
    override func move() -> String {
        return "Машина \(name) движется со скоростью \(speed) км/ч. Топливо \(fuelLevel)%."
    }

    init(fuelLevel: Int, name: String, speed: Int, passengerCapacity: Int) {
        self.fuelLevel = fuelLevel
        self.passengerCapacity = passengerCapacity
        super .init(speed: speed, name: name)
        
    }
}

let car = Car(fuelLevel: 50, name: "Bus", speed: 100, passengerCapacity: 34)


//    2.    Bike:
//    •    Реализует только протокол Transportable.
//    •    Метод move() возвращает строку вида:
//"Велосипед \(name) едет со скоростью \(speed) км/ч.".
//

class Bike: Transport {
    
    override func move() -> String {
        return "Велосипед \(name) едет со скоростью \(speed) км/ч."
    }
    
}

var bike = Bike(speed: 30, name: "Viper")
bike.move()
//4. Расширения
//
//    1.    Напишите расширение для протокола PassengerCarrying, которое добавляет метод calculateFullTrip(passengers: Int, distance: Int).
//    •    Метод должен возвращать строку, которая сообщает, сколько рейсов нужно, чтобы перевезти всех пассажиров на указанное расстояние.

extension PassengerCarrying {
    func calculateFullTrip(passengers: Int, distance: Int) -> String {
        guard passengerCapacity > 0 else { return "Невозможно перевезти пассажиров: вместимость должна быть больше 0." }
        
        let trips = (passengers + passengerCapacity - 1) / passengerCapacity // округление вверх
        return "Нужно \(trips) рейсов, чтобы перевезти \(passengers) пассажиров на расстояние \(distance) км, при вместимости транспорта \(passengerCapacity) пассажиров."
    }
}

car.calculateFullTrip(passengers: 100, distance: 20)


//    2.    Напишите расширение для класса Transport, которое добавляет метод compareSpeed(with other: Transport).
//    •    Метод возвращает строку вида:
//    •    "Транспорт \(name) быстрее \(other.name)."
//    •    Или "Транспорт \(other.name) быстрее \(name)."
//

extension Transport {
    func compareSpeed(with other: Transport) -> String {
        if other.speed < self.speed {
            return "Транспорт \(name) быстрее \(other.name)."
        } else if other.speed > self.speed {
            return "Транспорт \(other.name) быстрее \(name)."
        } else {
            return "Скорость транспорта \(other.name) такая же как и у \(name)."
        }
    }
}

bike.compareSpeed(with: car)


//5. Дополнительное задание
//
//Создайте несколько объектов:
//    •    Машина с названием “Toyota”, скоростью 120, вместимостью 5 и уровнем топлива 80%.
//    •    Велосипед с названием “BMX” и скоростью 25.
//    •    Проверьте все методы и расширения, написав в консоли результаты их работы.
//

var tyota = Car(fuelLevel: 80, name: "Toyota", speed: 120, passengerCapacity: 5)
var bmx = Bike(speed: 25, name: "BMX")

print(tyota.move())
print(tyota.compareSpeed(with: car))
print(tyota.calculateFullTrip(passengers: 10, distance: 100))

print(bmx.move())
print(bmx.compareSpeed(with: tyota))


//Вот новое задание для практики работы с классами, протоколами, наследованием и расширениями:
//
//Задание: “Система управления библиотекой”
//
//Описание: Вы разрабатываете систему для управления книгами в библиотеке. Необходимо создать базовый класс, несколько подклассов и расширения для добавления функциональности.
//
//Часть 1: Создайте протоколы
//
//    1.    Читабельный объект (Readable)
//    •    Свойство title (название объекта, String).
//    •    Метод description() (возвращает краткое описание объекта).
//    2.    Библиотечный объект (LibraryItem)
//    •    Свойство isAvailable (булево значение, доступен ли объект для выдачи).
//    •    Метод borrow() (изменяет доступность объекта и возвращает строку: "Объект \(title) выдан." или "Объект \(title) недоступен.").
//    •    Метод returnItem() (делает объект доступным для выдачи и возвращает строку: "Объект \(title) возвращен.").
//

protocol Readable {
    var title: String { get }
    func description() -> String
}

protocol LibraryItem: Readable {
    var isAvailable: Bool { get }
    func borrow() -> String
    func returnItem() -> String
}

//Часть 2: Создайте базовый класс
//
//    1.    Класс LibraryObject:
//    •    Свойства:
//    •    title (из протокола Readable).
//    •    isAvailable (из протокола LibraryItem).
//    •    Реализуйте методы из протоколов:
//    •    description(): возвращает строку: "Объект \(title): доступен - \(isAvailable)"
//    •    borrow() и returnItem() (по описанию выше).
//

class LibraryObject: Readable, LibraryItem {
    var title: String
    var isAvailable: Bool
    
    func description() -> String {
        if isAvailable {
            return "Объект \(title): доступен - \(isAvailable)"
        } else {
            return  "Объект \(title): недоступен - \(isAvailable)"
        }
    }
    
    func borrow() -> String {
        if isAvailable {
            isAvailable = false
            return "Объект \(title) взят в аренду."
        } else {
            return "Объект \(title) недоступен для аренды."
        }
    }
    
    func returnItem() -> String {
        if !isAvailable {
            isAvailable = true
            return "Объект \(title) возвращен."
        } else {
            return  "Объект \(title) недоступен."
        }
    }
    
    init(title: String, isAvailable: Bool) {
        self.title = title
        self.isAvailable = isAvailable
    }
    
}
//Часть 3: Создайте подклассы
//
//    1.    Класс Book:
//    •    Унаследуйте LibraryObject.
//    •    Добавьте новое свойство author (тип String).
//    •    Переопределите метод description(), чтобы возвращать:
//"Книга \(title), автор: \(author), доступна - \(isAvailable)".

class Book: LibraryObject {
    let author: String
    
    override func description() -> String {
        if isAvailable {
            return "Книга \(title), автор: \(author), доступна - \(isAvailable)"
        } else {
            return "Книга \(title), автор: \(author), недоступна - \(isAvailable)"
        }
    }
    
    init(author: String, title: String, isAvailable: Bool) {
        self.author = author
        super.init(title: title, isAvailable: isAvailable)
    }
}

let book1 = Book(author: "Александр Пушкин", title: "Война и мир", isAvailable: true)
book1.borrow()
book1.borrow()
book1.returnItem()

//    2.    Класс Magazine:
//    •    Унаследуйте LibraryObject.
//    •    Добавьте новое свойство issueNumber (тип Int).
//    •    Переопределите метод description(), чтобы возвращать:
//"Журнал \(title), выпуск №\(issueNumber), доступен - \(isAvailable)".
//

class Magazine: LibraryObject {
    var issueNumber: Int
    
    override func description() -> String {
        if isAvailable {
            return "Журнал \(title), выпуск №\(issueNumber), доступен - \(isAvailable)"
        } else {
            return "Журнал \(title), выпуск №\(issueNumber), недоступен - \(isAvailable)"
        }
    }
    
    init(issueNumber: Int, title: String, isAvailable: Bool) {
        self.issueNumber = issueNumber
        super.init(title: title, isAvailable: isAvailable)
    }
}

//Часть 4: Расширения
//
//    1.    Напишите расширение для протокола LibraryItem, добавляющее метод availabilityStatus().
//    •    Возвращает строку:
//"Объект \(title) доступен для выдачи."
//или
//"Объект \(title) недоступен для выдачи.".
//

// СЮДА НЕ СМОТРЕТЬ!!!!!
//extension LibraryItem {
//    func availabilityStatus() -> String {
//        switch self {
//        case let value as LibraryObject:
//            if value.isAvailable{
//                return "Объект \(value.title) доступен для выдачи."
//            } else {
//                return "Объект \(value.title) недоступен для выдачи."
//            }
//        default:
//            if self.isAvailable{
//                return "Объект \(self) доступен для выдачи."
//            } else {
//                return "Объект \(self) недоступен для выдачи."
//            }
//        }
//    }
//}

extension LibraryItem {
    func availabilityStatus() -> String {
        if self.isAvailable{
            return "Объект \(self.title) доступен для выдачи."
            } else {
            return "Объект \(self.title) недоступен для выдачи."
        }
    }
}

let vogue = Magazine(issueNumber: 1, title: "Vogue", isAvailable: true)
vogue.availabilityStatus()


//Часть 5: Дополнительное задание (необязательно)
//
//Добавьте новый подкласс DigitalMedia:
//    •    Унаследуйте LibraryObject.
//    •    Добавьте свойство fileSize (в мегабайтах, тип Double).
//    •    Переопределите метод description(), чтобы включить информацию о размере файла:
//"Цифровой медиафайл \(title), размер: \(fileSize)MB, доступен - \(isAvailable)".


class DigitalMedia: LibraryObject {
    var fileSize: Double
    
    override func description() -> String {
        return "Цифровой медиафайл \(title), размер: \(fileSize)MB, доступен - \(isAvailable)"
    }
    
    init(fileSize: Double, title: String, isAvailable: Bool) {
        self.fileSize = fileSize
        super.init(title: title, isAvailable: isAvailable)
    }
}

let smi = DigitalMedia(fileSize: 100, title: "SMI", isAvailable: true)
smi.description()
smi.availabilityStatus()
