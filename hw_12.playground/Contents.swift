/*
 Немного теории - Отличия class от struct и от enum
 1. В классах есть наследование, в структурах нет
 2. Структуры - это Value Type, классы - это Reference Type
 3. В структурах инициализаторы по умолчанию есть, в классах и енамах нет. В классе нужно написать отдельный инициализатор с помощью ключевого слова init
 Объявление - это когда мы просто дали имя переменной, например, но она не занимает память
 Инициализация - это когда уже в памяти появляется объект заполненный данными
 
 Создавая экземпляр класса мы создаем ссылку на ячейку памяти, в которой хранится объект этого класа. Имя экземпляра - ссылка н объект
 
 */

//ДЗ 12 - Class vs Struct
//
//Создать класс родитель и 2 класса наследника. Например, родитель - животное, а 2 наследника: жираф и крокодил. Распечатать их общее родительское свойство, а затем уникальные свойства

class Animal {
    let name: String
    let age: Int
    let color: String
    
    init(name: String, age: Int, color: String) { //инициализируем свойства класса с помощью конструктора, теперь при вызове конструктора можно передать нужные значения
        self.name = name
        self.age = age
        self.color = color
    }
}

class Giraffe: Animal { //создали класс и наследуемся от Animal
    var country: String //уникальное свойство для жирафа

    init(name: String, age: Int, color: String, country: String) {
        self.country = country
        super.init(name: name, age: age, color: color)
    }
    
}

class Crocodile: Animal { //создали класс и наследуемся от Animal
    var zoo: String //уникальное свойство для крокодила
    
    init(name: String, age: Int, color: String, zoo: String) {
        self.zoo = zoo
        super.init(name: name, age: age, color: color) //вызываем конструктор родителя с помощью ключевого слова super
    }
}

let giraffe = Giraffe(name: "Billie", age: 10, color: "Orange", country: "Africa") //экземпляр класса Giraffe
print("Жираф по имени - \(giraffe.name) имеет окрас - \(giraffe.color), ему - \(giraffe.age) лет и живет он в \(giraffe.country)")

let crocodile = Crocodile(name: "Gena", age: 5, color: "Green", zoo: "Moscow zoo") // экземпляр класса crocodile
print("Крокодил по имени \(crocodile.name) имеет окрас - \(crocodile.color), ему - \(crocodile.age) лет и он сейчас в \(crocodile.zoo)")


//Написать программу, в которой создать класс Car *name*, *countWheels* и несколько методов - *ride*(выводит произведение свойств), *stop*, *explode*

class Car {
    let name: String //название машины
    let countWheels: Int //кол-во колес
    var distance: Int
    let speed: Int
    let hours: Int
    let temperature: Int
    
 // инициализатор
    init(name: String, countWheels: Int, hours: Int, speed: Int, distance: Int = 0, temperature: Int ) {
        self.name = name
        self.countWheels = countWheels
        self.distance = distance
        self.speed = speed
        self.hours = hours
        self.temperature = temperature
    }
 // метод ride
    func ride() -> String {
        guard countWheels == 4 else {
            return "Машина \(name) не на ходу, у нее \(countWheels) колеса"
           
        }
        distance = speed * hours
        return "Машина \(name) на ходу, все \(countWheels) колеса на месте, она уже проехала \(distance) км"
    }
 // метод stopCar
    func stopCar (light: String) {
        switch light {
        case "Красный":
            print("Машина \(name) стоит")
        case "Зелёный":
            print("Машина \(name) продолжает движение")
        case "Желтый":
            print("Машина \(name) готовится ехать")
        default:
            print("Неизвестно")
        }
    }

 // Метод explode
    func explode() {
        if temperature > 250 {
            print("Машина \(name) перегрелась и взорвалась! ")
        } else {
            print("С машиной \(name) все в порядке ")
        }
    }
    
}


let porsche = Car(name: "Porsche", countWheels: 4, hours: 2, speed: 150, distance: 0, temperature: 4)
print(porsche.ride()) // Выводим результат метода ride
porsche.stopCar(light: "Зелёный") // Вызываем метод stopCar
porsche.explode() // Вызываем метод explode

//Создайте Класс с учениками, в котором будет метод, который принимает структуру/класс учеников и сортирует их по оценкам и возвращает отсортированных учеников

//Реализация с помошью двух классов

class Students {
    var name: String
    var grade: Int
    
    init(name: String, grade: Int) {
        self.name = name
        self.grade = grade
    }
}

class StudentsClass {
    var arrStudents = [Students]()
    
    init(arrStudents: [Students] = [Students]()) { //инициализируем массив
        self.arrStudents = arrStudents
    }
    
    func sortStudentsByGrade() -> [Students] {
        return arrStudents.sorted { $0.grade > $1.grade } // Сортируем массив студентов
    }
}

let arrayOfStudents = [Students(name: "Tasya", grade: 5),
                  Students(name: "Kris", grade: 5),
                  Students(name: "Lena", grade: 6),
                  Students(name: "Alina", grade: 7)]


let studentClass = StudentsClass(arrStudents: arrayOfStudents) // создаем объект studentClass класса StudentsClass и передаем ему массив студентов arrayOfStudents

let sortedSrudents = studentClass.sortStudentsByGrade() // вызываем функцию сортировки

for student in sortedSrudents { // проходимся циклом по отсортированному массиву
    print("Имя студента - \(student.name) и его оценка - \(student.grade)")
}

//Написать структуру или класс, и показать на примерах, чем отличается структура от класса

class Phones {
    let model: String
    let price: Double
    let color: String
    let os: String
    
    init(model: String, price: Double, color: String, os: String) {
        self.model = model
        self.price = price
        self.color = color
        self.os = os
    }
    
    func myPhone() {
        print("Мой телефон: \(model), цвета - \(color), ось: \(os)")
    }
}

let myiPhone = Phones(model: "iPhone 14 Pro", price: 200, color: "Purple", os: "IOS 18.0")
print(myiPhone.myPhone())


struct Laptop {
    let model: String
    let chip: String
    let color: String
    let os: String
    
    func myLaptopFunc() {
        print("Мой ноутбук: \(model), цвета - \(color), ось: \(os)")
    }
}

let myLaptop = Laptop(model: "MacBook Pro", chip: "M1 Pro", color: "Gray", os: "MacOs 15.0.1")
print(myLaptop.myLaptopFunc())




/*
1. Классы поддерживают наследование, а структуры нет
Наример, мы можем создать еще один класс myMomPhone наследоваться от класса Phone

 claa myMomPhone: Phone {
 
 }
 
2.Семантика значения - value семантика и reference семантика.
 Велью семантика присуща структурам. а референс - классам
 
То есть, в структурах, если мы одной переменной присвоем другую переменную, то при присвоении она скопируются, и если мы эту копию изменим, то оригинал останется неизменным, изменится только копия, а когда мы присваиваем объект в переменную, то в перменной хранится ссылка на объект в памяти
 
 v
 */
