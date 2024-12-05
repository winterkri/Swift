// Наследование:
// Наследование позволяет создавать новый класс на основе существующего.
// Новый класс (называемый дочерним) получает все свойства и методы родительского класса и может расширять их или изменять.
// Это помогает уменьшить количество повторяющегося кода, что делает его полезным для создания взаимосвязанных объектов.
// Например, класс "Автомобиль" может стать базой для создания специализированных классов, таких как "Грузовик" или "Легковой автомобиль".
//Ключевой особенностью Наследования является переиспользование кода. Чтобы не одинаковый код, мы наследуемся от других классов и все свойства и методы из суперкласса нас будут доступны в подклассе
//У каждого наследника только 1 суперкласс, но у сперкласса может быть много наследников


// Класс - это описание, а экземпляр класса это что-то конкретное по этому описанию.

// Инкапсуляция:
// Инкапсуляция скрывает детали реализации класса, предоставляя доступ к его функционалу через методы и свойства.
// Внешние объекты могут использовать только те функции класса, которые были открыты, в то время как внутренние данные и методы остаются недоступными.
// Например, данные пользователя могут быть закрытыми, а доступ возможен только через методы для чтения и записи этих данных.

// Полиморфизм:
// Полиморфизм позволяет объектам разных классов обрабатывать одни и те же методы по-разному.
// Благодаря этому, можно вызывать общий метод для разных объектов, и каждый из них выполнит свою реализацию метода.
// Например, метод "передвигаться" может быть реализован по-разному в классах "Птица" и "Автомобиль" — у первого полет, у второго езда.
// Если у нас есть функция которая принимает объект суперкласса, то эта же функция будет принимать и объектц наследников этого суперкласса


//Создать класс "Люди", в этом классе 4 property - "имя", "рост" (height), "вес" (weight), "пол", а также будет иметь метод "say", который будет что-то, свойственное человеку, говорить
//
//
//Создать sub class (наследники) "повар", "менеджер", "борец" и переопределить метод "say(говорит)". Чтобы по разному говорило: "Менеджер говорит: "
//
//Создать по одному объекту(экземпляру) каждого класса и объединить их в массив.
//В цикле “for in” пройти по всем элементам массива и вывести в консоль все характеристики каждого объекта (имя, рост и тд) и у каждого вызвать метод "say(говорит)".

enum Position {
    case Cook
    case Manager
    case Fighter
    case Developer
}

class Persons {
    let name: String
    let height: Double
    let weight: Double
    let gender: String
    
    init(name: String, height: Double, weight: Double, gender: String) {
        self.name = name
        self.height = height
        self.weight = weight
        self.gender = gender
    }
    
    func say() {
        print("Привет, меня зовут \(name), мой рост \(height), мой вес \(weight), мой гендер - \(gender)")
    }
}

class Cook: Persons {
    let position = Position.Cook // в целом enum и подобные строчки можно удалить, это сделает код чище, но оставила для практики
    
    override func say() {
        print("Привет, я \(position), хочешь приготовлю покушать?")
        print("____________________")
    }
}

class Manager: Persons {
    let position = Position.Manager
    
    override func say() {
        print("Привет, я \(position), у нас горят сроки, нужно завтра выгрузить")
        print("____________________")
    }
}

class Fighter: Persons {
    let position = Position.Fighter
    
    override func say() {
        print("Привет, я \(position), а ты лох цветочный, иди отсюда")
        print("____________________")
    }
}


var manager = Manager(name: "Стив", height: 176, weight: 70, gender: "Муж")
var cook = Cook(name: "Лидия", height: 160, weight: 60, gender: "Жен")
var fighter = Fighter(name: "Конор", height: 170, weight: 85, gender: "Муж")


class Task {
    var arr: [Persons] = []
    
    func addPerson(person: Persons) {//Добавляем персону в массив и тут работает полиморфизм, мы передадим этой функции объект с типом наследника от Persons
        arr.append(person)
    }
    
    func printAllPersons() {
        for person in arr {
            print("Имя - \(person.name), рост - \(person.height), вес - \(person.weight), пол - \(person.gender)")
            person.say()
            print("____________________")
        }
    }
    
    func printAllPersonsReversed() {
        let reversArr = Array(arr.reversed())
        print("Исходный массив: \(arr)")
        print("Перевернули массив: \(reversArr)")
        reversArr.forEach { person in
            print("Выводим в обратном порядке: ")
            print("Имя - \(person.name), рост - \(person.height), вес - \(person.weight), пол - \(person.gender)")
        }
    }
}

let task = Task()

//Вызываем функцию addPerson, она положит объекты в массив arr
task.addPerson(person: manager)
task.addPerson(person: cook)
task.addPerson(person: fighter)
//Вызываем функцию printAllPersons, которая распечатает нам все характеристики
task.printAllPersons()
task.printAllPersonsReversed()



//Задание 3.
//
//Создать еще одного наследника от super Class, добавить в него пару новых свойств, добавить в массив и в цикле вывода вывести его свойства как дополнение к свойствам People.
//Метод "say(говорит)" реализовать таким образом, чтобы перед тем как выполнить собственный method say, выполнялся сначала метод say класса People.
//Вывести все это в обратном порядке (Google в помощь).

class Developer: Persons {
    let position = Position.Developer
    let salary: Double
    let wear: String
    
    init(salary: Double, wear: String, name: String, height: Double, weight: Double, gender: String ) {
        self.salary = salary
        self.wear = wear
        super.init(name: name, height: height, weight: weight, gender: gender)
    }
    
    override func say() {
        super.say()
        print("Привет, я \(position), это вообще-то не баг, а фича'")
    }
    
}

var developer = Developer(salary: 3500.1, wear: "Hoodie", name: "Lia", height: 165, weight: 50, gender: "Жен")
//вызываем метод say
developer.say()

//вызываем метод добавления разраба в массив
task.addPerson(person: developer)


//Вызываем функцию printAllPersons, которая распечатает нам все характеристики
task.printAllPersons()

//Вывести все это в обратном порядке (Google в помощь). Тут я создала отдельную функцию, которая сначала переворачивает массив, а потом принтит - хз, наверное тупо
task.printAllPersonsReversed()



//Задание 4.
//
//Создать класс "Марсианин" (не наследник класса people!) со своими собственными property (отличными от people) и методом "say" (отличным от people).

class Martian {
    let nick: String
    let eyes: Int
    
    init(nick: String, eyes: Int) {
        self.nick = nick
        self.eyes = eyes
    }
    
    func martianSay() {
        print("hehe Mars our home hehe")
    }
}

//Унаследоваться от него и создать пару других классов (Инопланетян) с переопределенным методом "say".
class Aliens: Martian {
    override func martianSay() {
        print("hehe")
    }
}


let alien = Martian(nick: "Biba", eyes: 3)

//Объединить всех People и Марсианинов в один массив.
class Task2 {
    var all: [Any] = []
    
    func typePerson(arr: [Any]) {
        for i in arr {
            if let pers = i as? Persons{
                all.append(i)
            } else if let pers = i as? Martian {
                all.append(i)
            } else {
                print("Неопознанный вид")
            }
            }
        }
    }

let task2 = Task2()
//Кладем объекты класса Persons и Martian в массив
task2.typePerson(arr: [manager, cook, fighter, alien])

//В цикле выводить тип объекта (People или Марсианин), перед тем как выводить его свойства и вызывать метод
for i in task2.all {
    switch i {
    case let person as Persons:
        print("Параметры человека: пол: \(person.gender), рост: \(person.height), имя: \(person.name), вес: \(person.weight)")
        person.say()
    case let martian as Martian:
        print("Параметры марсианина: количетсво глан: \(martian.eyes), имя марсианина: \(martian.nick)")
        martian.martianSay()
    default:
        print("Неопознанный вид")
    }
}

//Задание 5.
//
//Поместить всех people в один массив, а Марсиан в другой массив (количество People и Марсиан должно быть разное)

//Создам новый массив, куда помщеу всех

let newArray: [Any] = [alien, fighter, cook, manager, developer]
var humanArray: [Persons] = []
var allienArray: [Martian] = []

for object in newArray {
    switch object {
    case let human as Persons:
        humanArray.append(human)
    case let alien as Martian:
        allienArray.append(alien)
    default:
        print("Неопознанный вид")
    }
}

print("Массив с человеками: \(humanArray.count)")
print("Массив с инопланетянами \(allienArray.count)")


//В одном цикле “for in” выводить People, а потом Марсианина, доставая данные поочередно из двух разных массивов, если в одном из массивов объектов больше, то в конце должны выводиться только объекты этого массива (так как других уже нет)

let maxLength = max(humanArray.count, allienArray.count) //Вычисляем максимальное количество элементов из двух массивов, чтобы цикл прошёл по всем элементам даже в случае, если один массив длиннее другого.

for i in 0...maxLength - 1 { //цикл от 0 до количества элементов - 5 (тк если элементов 5, то у последнего будет индекс 4, а если у нас  i будет больше или равно 5, то мы выйдем за границы)
    if humanArray.indices.contains(i) { //Проверяем, есть ли элемент с текущим индексом в массиве humanArray. Если есть, выводим его.
        print("Параметры человека из массива humanArray: пол: \(humanArray[i].gender), рост: \(humanArray[i].height), имя: \(humanArray[i].name), вес: \(humanArray[i].weight)")
        humanArray[i].say()
    }
    if allienArray.indices.contains(i) { //Проверяем, есть ли элемент с текущим индексом в массиве allienArray. Если есть, выводим его.
        print("Параметры марсианина из массива allienArray: количетсво глан: \(allienArray[i].eyes), имя марсианина: \(allienArray[i].nick)")
        allienArray[i].martianSay()
    }
}

////Для практики forEach
//humanArray.forEach { human in
//    print("Параметры человека из массива humanArray 2: пол: \(human.gender), рост: \(human.height), имя: \(human.name), вес: \(human.weight)")
//    human.say()
//}
//
//allienArray.forEach { alien in
//    print("Параметры марсианина из массива allienArray 2: количество глаз: \(alien.eyes), имя: \(alien.nick)")
//    alien.martianSay()
//}
//

