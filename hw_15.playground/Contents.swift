//ДЗ 15 - Subscript
//
//Создать класс, в котором будет 3 свойства мама, папа, дети. Создать subscript и упорядочить их по индексу
import Foundation

class Family {
    let mom: String
    let dad: String
    let children: [String]
    
    init(mom: String, dad: String, children: [String]) {
        self.mom = mom
        self.dad = dad
        self.children = children
    }
    
    subscript (index: Int) -> String {
        get {
            switch index {
            case 0:
                return mom
            case 1:
                return dad
            case 2..<2 + children.count:
                return children[index-2] //тут задаем диапазон от индекса 2 до 2 + кол-во детей не включительно и возвращаем ребенка
            default: return "Больше никого нет"
            }
        }
    }
}

let family = Family(mom: "Татьяна", dad: "Ушел за хлебом", children: ["Кристина", "Алина", "Мария", "Николай"])
print(family[0])
print(family[1])
print(family[2])
print(family[3])
print(family[4])
print(family[5])
print(family[6])


//Создать Индекс который будет принимать число умножать его на 100 и делить на 2

class Sum {
    let numbers = [1, 6, 7, 10]
    
    subscript (index: Int) -> Double {
        return Double(numbers[index] * 100 / 2) //извлекаем число из массива numbers по индексу, умножаем его на 100 и делим на 2
    }
}

let sum = Sum()
print(sum[2])


//Создать свой subscript у которого внутри есть оператор if else

class MyIfElseClass {
    var dict: [String: String] = [:]
    
    subscript (index: String) -> String {
        get {
            if let value = dict[index] {
                return value
            } else {
                return "Не найдено"
            }
        }
    }
}

let obj = MyIfElseClass()
obj.dict = ["Swift": "Language", "Hello": "World"]
print(obj["Swift"])
print(obj["Key"])
print(obj["Hello"])
print(obj["World"])


//Создать класс человек и в нем 3 свойства: имя, возраст, пол

enum Position {
    case QA
    case Developer
    case Designer
    case Manager
}

enum ColorEyes {
    case Green
    case Blue
    case Brown
}

class Human {
    var name: String
    let age: Int
    let gender: String
    let position: Position
    var eyes: [ColorEyes] = [.Blue, .Brown, .Green]
    
    init(name: String, age: Int, gender: String, position: Position ) {
        self.name = name
        self.age = age
        self.gender = gender
        self.position = position
    }
    subscript(index: Int) -> ColorEyes? {
        get {
                  guard index >= 0 && index < eyes.count else { return nil }
                  return eyes[index]
              }
        set {
                 guard index >= 0 && index < eyes.count, let newValue = newValue else { return }
                 eyes[index] = newValue
              }
    }
    
    func printMassage (colors: [ColorEyes]) {
        for color in colors {
            switch color {
            case .Blue:
                print("Здорово, у тебя \(color) глаза")
            case .Green:
                print("Ух ты, у тебя \(color) глаза")
            case .Brown:
                print("Класс, у тебя \(color) глаза")
            }
        }
    }
}

//Создать ещё 2 класса которые наследуются от класса человек и переопределить методы и свойства

class Women: Human {
    let height: Double
    
    init(name: String, age: Int, gender: String, height: Double, position: Position) {
        self.height = height
        super.init(name: name, age: age, gender: gender, position: position)
    }
    override func printMassage(colors: [ColorEyes]) {
        for color in colors {
            print("Ух ты, у тебя цвет глаз: \(color)")
        }
    }
    }


class Man: Human {
    let weight: Double
    
    init(name: String, age: Int, gender: String, weight: Double, position: Position) {
        self.weight = weight
        super.init(name: name, age: age, gender: gender, position: position)
    }
}
let human = Human(name: "Kristina", age: 28, gender: "F", position: Position.QA)
human[0]
human[0] = .Green
human[0]
human.printMassage(colors: [.Blue, .Brown])

let woman = Women(name: "Pauline", age: 24, gender: "F", height: 170, position: .Designer)
print(woman.gender)
woman.printMassage(colors: [.Blue, .Green])

let man = Man(name: "Max", age: 28, gender: "M", weight: 80, position: .QA)
print(man.position)

//Создать словарь, который хранит все типы данных, которые есть, а ключ должен быть только строка (воспользоваться enum для типов данных)

enum TypesData {
    case bool(Bool)
    case int(Int)
    case string(String)
    case double(Double)
    case float(Float)
    case char(Character)
}

class TypesDataStorage {
    var storageDict: [String: Any] = [:]
    
    init(element: [TypesData]) { //запихиваем массив типа TypesData в инициализатор, чтобы при создании объекта его сразу передать, а не после создания объекта
        for elem in element { //цикл по каждому элементу из переданного массива
            switch elem { //проверяем значение переменной elem
            case .bool(let value): // Если элемент - тип bool, то кладем значение в переменную value
                storageDict["bool"] = value // и добавляем его в словарь с ключом "bool"
            case .int(let value):
                storageDict["int"] = value
            case .string(let value):
                storageDict["string"] = value
            case .double(let value):
                storageDict["double"] = value
            case .float(let value):
                storageDict["float"] = value
            case .char(let value):
                storageDict["char"] = value
            }
        }
    }
}



var myStorage = TypesDataStorage(element: [.bool(true), .char("K"), .double(12.38493827423), .float(98.2), .int(20)])
print(myStorage.storageDict)


//Для тренировки
//Задача:
//Создайте enum под названием StorageItem, который будет хранить значения различных типов данных. Затем создайте класс Storage, который будет иметь массив для хранения этих значений. Напишите метод, который принимает элемент StorageItem и добавляет его в массив.
//
//Требования:
//Перечисление StorageItem должно включать следующие типы данных: Int, String, Double, Bool.
//Класс Storage должен:
//Иметь метод addItem(_:), который добавляет элемент StorageItem в массив.
//Иметь метод printAllItems(), который выводит каждый элемент массива с типом данных (например: "Целое число: 10", "Строка: Привет").

enum StorageItem {
    case int(Int)
    case string(String)
    case double(Double)
    case bool(Bool)
}

class Storage {
    var aarayStorage: [Any] = []
    
    func addItem(element1: [StorageItem]) {
        for i in element1 {
            switch i {
            case .bool(let value):
                aarayStorage.append(value)
            case .int(let value):
                aarayStorage.append(value)
            case .string(let value):
                aarayStorage.append(value)
            case .double(let value):
                aarayStorage.append(value)
            }
        }
    }
    
    func printAllItems(massiv: [Any]) { //можно передать новый массив
        for i in massiv {
            switch i {
            case let value as Bool: //чекаем, является ли i значением типа Bool, и, если это так, присваивает его переменной value
                print("Булевое значение: \(value)")
            case let value as Int:
                print("Целое число: \(value)")
            case let value as String:
                print("Строка: \(value)")
            case let value as Double:
                print("Число с плавающей точкой: \(value)")
            default:
                print("Не удалось определить тип данных")
            }
        }
    }
    func printAllItems2() { // можно заюзать уже готовый массив aarayStorage
        for i in aarayStorage {
            switch i {
            case let value as Bool: //чекаем, является ли i значением типа Bool, и, если это так, присваивает его переменной value
                print("Булевое значение: \(value)")
            case let value as Int:
                print("Целое число: \(value)")
            case let value as String:
                print("Строка: \(value)")
            case let value as Double:
                print("Число с плавающей точкой: \(value)")
            default:
                print("Не удалось определить тип данных")
            }
        }
    }
    }

    

var obj1 = Storage()
obj1.addItem(element1: [.bool(true), .double(1.823749234), .int(20), .string("K")])
print(obj1.aarayStorage)
obj1.printAllItems(massiv: ["Hi", 20, 1.823749234, true])
obj1.printAllItems2()





//Задача:
//Создайте enum под названием MediaItem, который будет представлять различные типы медиа-файлов, такие как аудио, видео и изображения. Каждый тип медиа-файла должен иметь связанное значение, которое хранит название файла (например, String) и его размер в мегабайтах (Double).
//
//Затем создайте класс MediaLibrary, который будет иметь массив для хранения медиа-файлов. Напишите метод, который принимает элемент MediaItem и добавляет его в массив, а также метод для подсчета общего объема всех медиа-файлов в библиотеке (в мегабайтах).

enum MediaItem {
    case audio(String, Double)
    case video(String, Double)
    case image(String, Double)
}

class MediaLibrary {
    var mediaItems: [MediaItem] = []
    var mediaItemsDict: [String: (Any)] = [:]
    
    func addItem(element: MediaItem) { //метод, который принимает element и добавляет его в массив mediaItems
        mediaItems.append(element)
    }
    
    func addItem2(element: MediaItem) { //метод, который принимает element типа MediaItem
        switch element {
        case let .audio(name, size): // Проверяем, является ли элемент вариантом .audio.
            // Если да, извлекаем связанное значение (название и размер аудиофайла)
            // и присваиваем их константам name и size для дальнейшего использования.
            print("Аудиофайл: \(name), размер: \(size) MB")
            mediaItemsDict["Audio"] = (name, size) //кладем значения в словарь mediaItemsDict
        case let .video(name, size):
            print("Видеофайл: \(name), размер: \(size) MB")
            mediaItemsDict["Video"] = (name, size)
        case let .image(name, size):
            print("Картинка: \(name), размер: \(size) MB")
            mediaItemsDict["Pic"] = (name, size)
        }
    }
    
    func allSize(element: [MediaItem]) -> Double {
        var sum: Double = 0
        for i in element {
            switch i {
            case let .audio(_, size),
                 let .video(_, size),
                 let .image(_, size):
                 sum += size
            }
        }
        return sum
    }
}


let file = MediaLibrary()

file.addItem(element: .video("8 миля", 2000))
print(file.mediaItems)
file.addItem2(element: .image("Vocation", 6))
file.addItem2(element: .audio("2pac", 10))
print(file.mediaItemsDict)
print(file.allSize(element: [.audio("Kendrick Lamar", 10), .video("Солнцестояние", 20000), .image("Me", 11), .image("My friends", 1.2)]))

/*
Задача:
Создайте enum под названием Shape, который будет представлять различные геометрические фигуры: circle, rectangle, и triangle. Каждая фигура должна иметь соответствующие ассоциированные значения:

circle: радиус (тип Double)
rectangle: ширина и высота (тип Double)
triangle: основание и высота (тип Double)
 
Создайте класс ShapeCalculator, который будет содержать массив для хранения фигур Shape.

Добавьте методы для:

Добавления фигур в массив.
 
Подсчета площади всех фигур в массиве. Площадь для каждой фигуры должна вычисляться следующим образом:
 
Круг: π * радиус²
Прямоугольник: ширина * высота
Треугольник: (основание * высота) / 2
*/

enum Shape {
    case circle(Double)
    case rectangle(Double, Double)
    case triangle(Double, Double)
}

class ShapeCalculator {
    var shapes: [Shape] = []
    
    func addShape(shape: Shape) {
        switch shape {
            case let .circle(radius):
            shapes.append(shape)
        case let .rectangle(width, height):
            shapes.append(shape)
        case let .triangle(base, height):
            shapes.append(shape)
        }
    }
    
    func areaAllShapes() {
        for shape in shapes {
            switch shape {
            case let .circle(radius):
                print("Площадь круга: \(Double.pi * (radius * radius))")
            case let .rectangle(width, height):
                print("Площадь прямоугольника: \(width * height)")
            case let .triangle(base, height):
                print("Площадь треугольника: \((base * height) / 2)")
}
        }
    }
    
}

let allShapes = ShapeCalculator()

//функция addShape, тут передаем фигуры
allShapes.addShape(shape: .circle(1.23))
allShapes.addShape(shape: .rectangle(2.39, 9))
allShapes.addShape(shape: .triangle(4.56, 7.89))

print(allShapes.shapes)

//функция areaAllShapes
allShapes.areaAllShapes()


// еще задание на сабскрипт
//Задание: Создание структуры с сабскриптом
//Создай структуру Month, которая будет представлять месяцы года и позволит получать название месяца по его номеру. Вот какие шаги нужно выполнить:
//
//Создай структуру Month:
//
//Внутри структуры создай массив строк с названиями месяцев: ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"].
//Реализуй сабскрипт:
//
//Добавь сабскрипт, который принимает индекс (номер месяца) от 1 до 12 и возвращает название месяца.
//Если переданный индекс не в диапазоне от 1 до 12, сабскрипт должен вернуть nil.
//Проверь работу структуры:
//
//Создай экземпляр Month и попробуй получить названия месяцев по номерам (например, month[1] должно вернуть "Январь", а month[12] — "Декабрь").
//Проверь, что при передаче неправильного номера (например, 0 или 13) возвращается nil.

struct Month {
    let arrayMonth = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]
    
    subscript (index: Int) -> String? {
        get {
            guard index >= 1 && index <= 12 else { return nil }
            return "Название месяца - \(arrayMonth[index - 1])"

        }
    }
}

let month = Month()
print(month[1] ?? "Такого месяца не существует")
print(month[12] ?? "Такого месяца не существует")
print(month[111] ?? "Такого месяца не существует")


//Создайте структуру Student, которая будет представлять студента и хранить информацию о его оценках. В этой структуре:

//Создайте массив grades для хранения оценок студента.
//Реализуйте сабскрипт, который будет:
//Геттером: возвращать оценку по индексу (если индекс вне диапазона, возвращать nil).
//Сеттером: устанавливать новую оценку по индексу (если индекс вне диапазона, ничего не делать).
//Добавьте метод addGrade, который будет добавлять новую оценку в массив.
//Дополнительные требования
//Реализуйте в структуре Student свойство averageGrade, которое будет вычислять среднюю оценку студента.
//Создайте экземпляр структуры Student, добавьте несколько оценок, выведите их на экран, а также выведите среднюю оценку.

struct Student {
    var grade: [Int] = []
    
    subscript (index: Int) -> Int? {
        get {
            guard index < grade.count && index >= 0 else { return nil }
            return grade[index]
        }
        set {
            guard index >= 0 else { return }
            if let value = newValue { //кладем newValue в переменную value
                if index < grade.count { //если индекс существует
                    grade[index] = value // то меняем оценку по переданному индексу
                } else {
                    grade.append(value) //иначе добавляем новую оценку в массив
                }
            }
        }
    }
    mutating func addGrade(gradeAdd: Int) { //с помощью ключевого слова mutating говорим, что изменятся будет массив grade
            grade.append(gradeAdd)
        }
    
    func averageGrade(grades: [Int]) -> Double? {
        var sum: Double = 0
        guard !grades.isEmpty else {return nil} //проверяем что массив не пустой
        for i in grades { // проходимся циклом по массиву
            sum += Double(i) // прибавляем каждую оценку к sum
        }
        return sum / Double(grades.count) //считаем среднее
    }
    
}

var student = Student()
//метод addGrade, добавляем оценки в массив
student.addGrade(gradeAdd: 190)
student.addGrade(gradeAdd: 11)
student.addGrade(gradeAdd: 20)
print(student.grade)

//метод averageGrade, передаем массив оценокgrade
print(student.averageGrade(grades: student.grade) ?? "Оценок нет")
//print(student.averageGrade(grades: [2, 5, 5, 4, 3]) ?? "Оценок нет")
print(student.averageGrade(grades: []) ?? "Оценок нет")



// Сбаскрипт
student[0]
student[0] = 10
print(student.grade)


//Задача:

//Представь, что ты пишешь структуру для хранения информации о фильмотеке. У каждого фильма есть название, год выпуска и жанр. Тебе нужно создать структуру FilmCollection, которая будет хранить массив фильмов и предоставлять сабскрипт, позволяющий получать фильм по названию.
//
//Условия задачи:
//
//    1.    Создай структуру Film, которая будет содержать свойства:
//    •    title: название фильма (строка),
//    •    year: год выпуска (целое число),
//    •    genre: жанр (строка).
//    2.    Создай структуру FilmCollection, которая будет иметь массив films, состоящий из нескольких объектов Film.
//    3.    Реализуй сабскрипт в структуре FilmCollection, который принимает название фильма (тип String) и возвращает объект Film, если фильм с таким названием существует, или nil, если нет.
//    4.    Добавь метод для добавления фильмов в коллекцию, чтобы можно было протестировать сабскрипт с разными фильмами.


struct Film {
    var title: String
    var year: Int
    var genres: String
}

struct FilmCollection {
    var films: [Film] = []
    
    subscript(name: String) -> Film? {
           for film in films {
               guard film.title == name else { continue }
                   return film
               }
           return nil
       }
    
    mutating func appendArray(object: Film) {
        films.append(object)
    }
}

let filmOne = Film(title: "Солнцестояние", year: 2022, genres: "Хоррор")
let filmTwo = Film(title: "Реинкарнация", year: 2023, genres: "Хоррор")
let filmThree = Film(title: "Дом который построил Джек", year: 2023, genres: "Хоррор")
var filmColl = FilmCollection()
filmColl.appendArray(object: filmOne)
filmColl.appendArray(object: filmTwo)
filmColl.appendArray(object: filmThree)
print(filmColl.films)

if let foundFilm = filmColl["Солнцестояние"] {
    print("Найден фильм: \(foundFilm.title), \(foundFilm.year), \(foundFilm.genres)")
} else {
    print("Фильм не найден")
}

