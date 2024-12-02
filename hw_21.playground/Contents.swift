//ДЗ 21 - Generic / дженерики
//
//Создать любой Generic для классов, структур, методов, перечислений (по 1 на каждый).
//Немного теории
/*
Запись <T> после названия структуры означает, что структура является дженериком. Дженерик позволяет структуре, классу или функции работать с разными типами данных, не ограничиваясь конкретным типом.
 Дженерики делают код:
     •    Гибким: Одна структура может работать с любым типом данных, не нужно дублировать код для каждого типа.
     •    Типобезопасным: Если мы укажем тип Int, структура будет принимать только числа, а попытка добавить строку вызовет ошибку.
 
Можно создавать дженерик-расширения (extensions) для классов, структур или перечислений, которые изначально не являются дженериками. Это позволяет добавлять методы, функции или свойства, использующие дженерики, к существующим типам.
 */
// дженерик-структура
struct MyGenerics <T> {
    var elements: [T] = []
    
    mutating func addElement(_ elem: T) {
        elements.append(elem)
    }
}

var structObject = MyGenerics<Int>()
structObject.addElement(10)
structObject.addElement(6)
structObject.addElement(09)
print(structObject.elements)

//дженерик класс
class MyGenericsClass <T> {
    var elements: [T] = []
    
    func addElement(_ elem: T) {
        elements.append(elem)
    }
}

class Name: MyGenericsClass<String> { //наследуем функциональность от MyGenericsClass, но задаем тип T как String.
    func printNamesAndIndex() {
        for (i, j) in elements.enumerated() {
            print("Элемент: \(j), Индекс: \(i)")
        }
    }
}


let name2 = MyGenericsClass<Int>()
name2.addElement(20)
name2.addElement(40)
print(name2.elements)

let name = Name()
name.addElement("Hello")
name.addElement("World")
print(name.elements)
name.printNamesAndIndex()

//Дженерик-перечисление
enum Errors <T> {
    case errorCodeServer(T)
    case errorCodeClient(T)
    case errorCodeOther(String)
}


let client: Errors<Int> = Errors.errorCodeClient(404)
let something: Errors<String> = Errors.errorCodeOther("POP100-PBVT-1000")
let server: Errors<Int> = Errors.errorCodeServer(500)

switch something {
case .errorCodeServer(let code):
    print("Код: \(code), сервер лежит")
case .errorCodeClient(let code):
    print("Код: \(code), что-то с клиентом")
case .errorCodeOther(let code):
    print("Код: \(code), непонятная унгабунга")
}

//Написать функцию, которая принимает Generic объект и складывает в массив/словарь (на выбор)

var arrAny: [Any] = []
@MainActor func appendInArray<T>(_ element: T) {
    arrAny.append(element)
}

var dictAny: [String: Any] = [:]
@MainActor func appendInDictionary<T>(_ element: T) {
    dictAny["\(Int.random(in: 1...100))"] = element
}

appendInArray(678)
appendInArray("Hej")
appendInArray(true)
print(arrAny)

appendInDictionary(20)
appendInDictionary("Blabla")
appendInDictionary(false)
appendInDictionary(3.14)
print(dictAny)


//Написать класс на свое усмотрение (любые методы, проперти) универсального типа. Используя extension, расширить класс.

class Robots<T, U> {
    let name: T
    let hands: U
    
    init(name: T, hands: U) {
        self.name = name
        self.hands = hands
    }
    
    func robotInfo() {
        switch hands {
        case let hand as Bool where hand == true:
            print("Робот - \(name) имеет руки")
        case let hand as Bool where hand == false:
            print("Робот - \(name) не имеет рук")
        default:
            print("Робот - \(name) имеет \(hands) рук(и)")
        }
    }
}

var robotOne: Robots<String, Bool> = Robots(name: "R2D2", hands: false)
var robotTwo: Robots<Int, Int> = Robots(name: 956, hands: 2)
var robotThree: Robots<String, Bool> = Robots(name: "Tesla robot", hands: true)
var robotFour: Robots<String, String> = Robots(name: "Rose", hands: "Много")

robotOne.robotInfo()
robotTwo.robotInfo()
robotThree.robotInfo()
robotFour.robotInfo()

var robots: [Any] = []
//var robots: [Robots] = []
    
extension Robots {
    @MainActor func addArray() {
        robots.append((self.name, self.hands))
//      robots.append(self) //не получилось положить в массив объекты задав массив - var robots: [Robots<Any, Any>] = []
        }
    }

robotOne.addArray()
robotTwo.addArray()
robotThree.addArray()
robotFour.addArray()

print(robots)
//robotOne.addArray((robotOne.name, robotOne.hands))
//robotTwo.addArray((robotTwo.name, robotTwo.hands))
//robotThree.addArray((robotThree.name, robotThree.hands))
//robotFour.addArray((robotFour.name, robotFour.hands))



// Доп задания
//1. Создание дженериков
//
//    •    Создай класс с дженериком (например, Box), который хранит любое значение. Добавь метод, возвращающий это значение.

class Box<T> {
    var symbol: T
    
    init(symbol: T) {
        self.symbol = symbol
    }
    
    func getSymbol() -> T {
        return symbol
    }
}

let symbol1: Box<String> = Box(symbol: "^")
symbol1.getSymbol()

//    •    Создай структуру с дженериком (например, Pair), которая содержит два значения одного типа. Добавь метод для сравнения этих значений.

struct Pair<T: Equatable> {
    var first: T
    var second: T
    
    func isEqual() -> Bool {
        if first == second {
            return true
        }
        return false
    }
    
}

let compare = Pair(first: 1, second: 1)
let compar2 = Pair(first: 2.0, second: 1.0)
compar2.isEqual()
compare.isEqual()


//    •    Создай перечисление с ассоциативными значениями (например, Result), используя дженерик для успеха (Success) или ошибки (Failure).

enum Result<T> {
    case success(T)
    case failure(T)
}

var error1 = Result.success(200)
var error2 = Result.failure("Error")
var error3 = Result.success(100)
var error4 = Result.failure(500)

func printError<T>(_ error: Result<T>) {
    switch error {
    case .failure(let value):
        print("Ошибка \(value)")
    case .success(let value):
        print("Успех \(value)")
    }
}

printError(error1)
printError(error2)
printError(error3)
printError(error4)

//    •    Напиши метод, который принимает два значения любого типа (с использованием дженерика), сравнивает их и возвращает большее значение.

func compareFunc<T: Comparable>(_ first: T, _ second: T) -> T {
    if first > second {
        return first
    } else {
        return second
    }
}

compareFunc("abs", "abs")
compareFunc(1, 100)
//
//        2. Работа с дженериками в коллекциях
//
//                •    Напиши функцию, которая принимает объект дженерика (например, объект из твоего класса или структуры) и добавляет его в массив или словарь (на выбор).
            
var arrayOfObjects: [Any] = []
            func addToArray<T>(_ object: T, arr: inout [T]) {
                arr.append(object)
}

addToArray(robotOne, arr: &arrayOfObjects)
print(arrayOfObjects)
//                •    Например, если это массив, то функция должна возвращать обновленный массив. Если словарь — добавлять значения по уникальному ключу.)
