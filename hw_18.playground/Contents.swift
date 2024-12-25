//////Сделать класс Люди, у класса будут свойства (проперти) родственники, соседи и тд (всё опционально).
///
///
class Human {
    let name: String
    let age: Int
    var parents: [Human]? = []
    var kids: [Human]? = []
    var neighbors: [Human]? = []
    var grandParents: [Human]? = []
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    // Метод для добавления родителя и автоматического добавления текущего человека в список детей родителя
    func addParent(parents: Human) {
        self.parents?.append(parents)
        parents.kids?.append(self)
    }
    // Метод для добавления ребенка и автоматического добавления родителя в список родителей ребенка
    func addKids(kids: Human) {
        self.kids?.append(kids)
        kids.parents?.append(self)
    }
    // Метод для добавления соседа и автоматического добавления текущего человека в список соседей соседа
    func addNeighbors(neighbor: Human) {
        self.neighbors?.append(neighbor)
        neighbor.neighbors?.append(self)
    }
    // Метод для добавления бабушек и дедушек
    func addGrandParents(grandParent: Human) {
        self.grandParents?.append(grandParent)
    }
    
    // Метод для получения братьев и сестер через опциональные цепочки
    // Используется проверка на отсутствие дублирования и на самого себя
    
    func getBro () -> [Human] {
        var siblings2: [Human] = []
        // Проходим по всем родителям человека с помощью цикла forEach
        self.parents?.forEach({ parent in
            // Проходим по всем детям каждого родителя (то есть по всем братьям и сестрам)
            parent.kids?.forEach({ kid in
                // Проверяем, что "ребенок" не является самим текущим человеком
                if kid !== self && !siblings2.contains(where: { $0 === kid })  { // и проверяем есть ли такой kid уже в массиве или нет, это нужно чтобы избавиться от дулирования детей
                    siblings2.append(kid) // и кладем их в массив
                }
            })
        })
        return siblings2 //возвращаем массив
    }
    // Метод для получения дядь и теть через опциональные цепочки
    // Мы находим детей бабушек и дедушек, кроме самого родителя
    
    func getUncles() -> [Human] {
        var uncles: [Human] = []
        
        // Ищем дядь и теть: перебираем всех бабушек и дедушек через родителей
        self.parents?.forEach { parent in
            parent.parents?.forEach { grandparent in
                // Добавляем всех детей бабушек и дедушек, кроме самого родителя
                grandparent.kids?.forEach { sibling in
                    if sibling !== parent && !uncles.contains(where: { $0 === sibling }) {
                        uncles.append(sibling)
                    }
                }
            }
        }
        
        return uncles
    }
    
    // Метод для получения двоюродных братьев и сестер через опциональные цепочки
    // Мы находим детей братьев и сестер родителей, исключая самих родителей
    
    func getСousins() -> [Human] {
        var cousins: [Human] = []
        
        // Проходим по родителям
        self.parents?.forEach { parent in
            // Проходим по бабушкам и дедушкам
            parent.parents?.forEach { grandparent in
                // Проходим по детям бабушек и дедушек
                grandparent.kids?.forEach { sibling in
                    // Добавляем в список двоюродных братьев и сестер
                    if sibling !== parent { // Исключаем самого родителя
                        sibling.kids?.forEach { cousin in
                            // Добавляем в список, если это не дублируется
                            if !cousins.contains(where: { $0 === cousin }) {
                                cousins.append(cousin)
                            }
                        }
                    }
                }
            }
        }
        
        return cousins
    }
}

//Создать нужно более 25 человек.
let human1 = Human(name: "Алексей", age: 25)
let human2 = Human(name: "Борис", age: 30)
let human3 = Human(name: "Виктория", age: 22)
let human4 = Human(name: "Дмитрий", age: 28)
let human5 = Human(name: "Екатерина", age: 35)
let human6 = Human(name: "Фёдор", age: 40)
let human7 = Human(name: "Галина", age: 27)
let human8 = Human(name: "Григорий", age: 33)
let human9 = Human(name: "Ирина", age: 24)
let human10 = Human(name: "Иван", age: 29)
let human11 = Human(name: "Ксения", age: 23)
let human12 = Human(name: "Алиса", age: 17)
let human13 = Human(name: "Мария", age: 23)
let human14 = Human(name: "Наталья", age: 32)
let human15 = Human(name: "Олег", age: 5)
let human16 = Human(name: "Павел", age: 45)
let human17 = Human(name: "Роман", age: 32)
let human18 = Human(name: "Раиса", age: 38)
let human19 = Human(name: "Сергей", age: 2)
let human20 = Human(name: "Татьяна", age: 11)
let human21 = Human(name: "Ульяна", age: 39)
let human22 = Human(name: "Виктор", age: 15)
let human23 = Human(name: "Вера", age: 28)
let human24 = Human(name: "Кирилл", age: 74)
let human25 = Human(name: "Ярослава", age: 84)

//Установка связей
// Устанавливаем родителей
human2.addParent(parents: human5)  // human5 - родитель human2 - Екатерина
human2.addParent(parents: human6)  // human6 - родитель human2 - Фёдор

//Устанавливаем бабушку и дедушку для human2
human2.addGrandParents(grandParent: human24) // human24 - дедушка human2 - Кирилл
human2.addGrandParents(grandParent: human25) // human25 - бабушка human2 - Ярослава

// Добавляем всех детей родителям human2
human5.addKids(kids: human22) // Виктор
human6.addKids(kids: human22) // Виктор
human5.addKids(kids: human20) // Татьяна
human6.addKids(kids: human20) // Татьяна
human6.addKids(kids: human11) // Ксения

// Добавляем детей для бабушки и дедушки human2
human24.addKids(kids: human16) // Павел
human25.addKids(kids: human16) // Павел
human24.addKids(kids: human17) // Роман
human25.addKids(kids: human17) // Роман
human24.addKids(kids: human5) // Екатерина
human25.addKids(kids: human5) // Екатерина
human25.addKids(kids: human13) // Мария

//Добавляем детей тетям и дядям human2
human16.addKids(kids: human15) // Олег
human17.addKids(kids: human12) // Алиса
human17.addKids(kids: human19) // Сергей


//Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь

let bro = human2.getBro() // мозг вскипел, не могу придумать уже норм имена переменным, пусть будет так
let un = human2.getUncles()
let cous = human2.getСousins()
print("Братья и сестры \(human2.name) - \(bro.map { $0.name })")  // Печатаем имена всех братьев и сестер Бориса
print("Тети и дяди \(human2.name) - \(un.map { $0.name })") // // Печатаем имена всех теть и дядь Бориса
print("Двоюродные сестры и братья \(human2.name) - \(cous.map { $0.name })") // // Печатаем имена всех двоюродных братьев и сестер Бориса



//Не используя цепочки
// Метод для получения братьев и сестер без опциональных цепочек
//    func getSiblings() -> [Human] {
//        var siblings: [Human] = [] //объявляем массив, в который будем складывать найденных братьев и сестер
//        if let per = parents {
//            for parent in per { // бежим по массиву parents
//                if let lid = parent.kids { // тут мы делаем бендинг, разворачиваем опционал безопасно
//                    for child in lid {
//                        if child !== self {  //если в parent.kids лежат еще дети, кроме себя
//                            siblings.append(child) // то кладем их в массив
//                        }
//                    }
//                }
//            }
//        }
//        return siblings //возвращаем массив
//    }
    
//    // Метод для поиска дядь и теть
//    func getUncles() -> [Human] {
//        var uncles: [Human] = []
//        
//        // Проверяем, есть ли родители у текущего человека
//        if let parents = parents {
//            // Перебираем каждого родителя
//            for parent in parents {
//                // Проверяем, есть ли у родителя свои родители (бабушки и дедушки)
//                if let grandparents = parent.parents {
//                    // Перебираем каждого бабушку или дедушку
//                    for grandparent in grandparents {
//                        // Проверяем наличие детей у бабушки/дедушки
//                        if let siblings = grandparent.kids {
//                            // Перебираем братьев и сестер родителя
//                            for sibling in siblings {
//                                // Проверяем, что брат или сестра не является самим родителем
//                                if sibling !== parent {
//                                    uncles.append(sibling)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//        return uncles
//    }


//Создать класс животных и свойства (проперти) - корова, коза, собака и тд

class Animal {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let dog = Animal(name: "Betty", age: 2)
let cow = Animal(name: "Burenka", age: 10)
let goat = Animal(name: "Miley", age: 3)



//Создать класс растения и проперти - трава, цветы и тд

class Plants {
    var name: String
    var color: String
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}

let trava = Plants(name: "Podoroznik", color: "Green")
let flower = Plants(name: "Rose", color: "Red")

//Положить их всех в массив


var arrayForAll = [AnyObject]() // в массив AnyObject мы можем положить любой объект разных классов, а если массив Any, то в массив можно положить все, что угодно

@MainActor func addInArray(object: AnyObject) {
    switch object {
    case let value as Plants:
        arrayForAll.append(value)
    case let value as Animal:
        arrayForAll.append(value)
    case let value as Human:
        arrayForAll.append(value)
    default:
        print("Не удалось определить тип")
    }
}

addInArray(object: human1)
addInArray(object: human2)
addInArray(object: human22)
addInArray(object: dog)
addInArray(object: flower)
addInArray(object: trava)
addInArray(object: goat)

print("Исходный массив \(arrayForAll) ")

//и отсортировать по алфавиту и по классу - люди - животные - растения
// Сортировка по классу (типу объекта)
arrayForAll.sort { (x, y) -> Bool in // метод sort сразу сортирует исходный массив - https://obodev.github.io/posts/function-higher-order/
    // Сравниваем типы объектов
    switch (x, y) {
    case (is Human, is Animal), (is Human, is Plants): //    is — это оператор, который проверяет, является ли объект объектом определенного типа. Например, x is Human проверяет, является ли объект y экземпляром класса Human. Далее проверяется если x — это экземпляр класса Human, а y — экземпляр класса Animal. То в этом случае вернется true, то есть люди идут перед животными. И также для Людей и Растений
        return true
    case (is Animal, is Plants): // проверка, что x — Animal, а y — Plants, и возвращается true, чтобы объект типа Animal находится перед объектом типа Plants.
        return true
    default:
        return false // по умолчанию массив остается неотсортированным
    }
}


// Печатаем объекты из массива arrayForAll
arrayForAll.forEach { object in
    switch object {
    case let value as Human:
        print(value.name)
    case let value as Animal:
        print(value.name)
    case let value as Plants:
        print(value.name)
    default:
        print("пупупу, такого не знаю")
    }
}


