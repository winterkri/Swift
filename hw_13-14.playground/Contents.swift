/* ДЗ 14 - Property type

Создать класс "Students", добавить ему property: dateOfBirth, skills.

*/


class Students {
    let dateOfBirth: Int
    let skills: [String]
    
    init(dateOfBirth: Int, skills: [String]) {
        self.dateOfBirth = dateOfBirth
        self.skills = skills
    }
}

//Создать свои структуры с разными видами свойств: сохраняемые/не сохраняемые, вычисляемые, свойства типа и т.д.

struct Dorama {
    // Сохраняемые свойства
    let title: String
    var episodes: Int
    var genre: String
    
    // Вычисляемое свойство с геттером и сеттером
    var episodesGet: String {
        get {
            return "\(episodes) эпизодов"
        }
        set {
            // Преобразуем строку в Int, если она имеет числовое значение
            if let newEpisodes = Int(newValue) { // если в newValue строка только с числовым значением, то преобразуем его в Int и присвоем в newEpisodes
                episodes = newEpisodes // присваиваем в episodes значение newEpisodes
            } else {
                print("Данную строку невозможно преобразовать в Int") // если в строке не только числа, то печатаем ошибку
            }
        }
    }
    
    // Свойство типа
    static let platform = "ivi"
}

var dorama = Dorama(title: "Игра в кальмара", episodes: 9, genre: "Триллер") // создаем объект структуры Dorama

// Использование геттера
print(dorama.episodesGet) // Вывод: 9 эпизодов

// Использование сеттера
dorama.episodesGet = "18"
print(dorama.episodes) // Вывод: 18

// Пример неправильного ввода
dorama.episodesGet = "18 эпизодов" // Вывод: Ошибка: неверный формат для количества эпизодов


// Для тренировки
struct Person {
    var salary: Int
    var moneybox: Int
    
    var sumtMoney: Int {
        get { //Вычисляемое свойство - Read Only, в данном случае, можно геттер не писать, но для наглядности оставила. Свойств только с сеттером не существет!
            salary + moneybox
        }
    }
}

let howMoney = Person(salary: 1000, moneybox: 5000)
print(howMoney.sumtMoney)

// Хранимые свойства - это те, свойства, которые хранят какие-то данные. Это основной вид свойств.
// Ленивые свойства. Ленивое свойство помечается ключевым словом lazy, и оно обязано быть переменной, в остальном оно мало чем отличается от обычного свойства. Но на самом деле, несмотря на присвоение ему строки "hello", у него не будет значения. Значение появится в момент первого обращения к свойству. Ленивые свойства обычно хранят что-то тяжелое.

struct Song {
    var title = "Kendric Lamar - Money Trees" //хранимое свойство
    var duration: Double = 3.85
    var picture: String?
    lazy var prodaction: String = "Kendric Records" // Ленивое свойство
    
    init(title: String, duration: Double, picture: String?) {
        self.title = title
        self.duration = duration
        self.picture = picture
    }
}

//Наблюдатели свойств

struct PersonAge {
    var age: Int { //Хранимая переменная
           willSet { //эта функция вызовется перед тем, как свойство получит новое значение
               print("Новое значение \(newValue)")
           }
           didSet { //вызывается после того как установлено значение и оно выведет старое значение до установки нового
               print("Старое значение \(oldValue)")
           }
       }
    init(age: Int) {
        self.age = age
    }
}

var myAge = PersonAge(age: 21)
myAge.age = 28



// Написать структуру "CreateTriangle", с двумя свойствами - угол A, угол C. В которые мы можем записать какие-то значения, и сделать вычисляемое свойство угол B, которые будет вычисляться по правилу суммы углов треугольника (180 градусов). То есть, мы записываем в угол A - 50 градусов, C - 120 градусов, а в B будет автоматически вычисляться свойство и возвращать нам 10 градусов

struct CreateTriangle {
    var a: Double = 0
    var c: Double = 0
    
    var b: Double {
        return 180 - a - c
    }
}

let triangle = CreateTriangle(a: 50, c: 120)
print(triangle.b)


//Создать структуру "Резюме", у которой есть такие свойства:
//- Фамилия,
//- Имя,
//- Должность (может быть enum, с определенным набором должностей)
//- Опыт,
//- Контактные данные (телефон, емейл) (Может быть другой структурой)


enum Position {
    case QA
    case Developer
    case Analyst
    case Manager
    case HR
}

struct Contacts {
    var email: String
    var phone: String
}
    
struct Resume {
    let surname: String
    let name: String
    let position: Position
    let experience: String
    let contactData: Contacts
}


var candidate = Resume(surname: "Иванова", name: "Полина", position: Position.QA, experience: "5 лет", contactData: Contacts(email: "ivanova@bk.ru", phone: "+79899999999"))
print(candidate.name)
print(candidate.contactData)
print(candidate.position)


//Написать класс, в котором есть 4 метода:
//- Пустой, которая просто выводит сообщение через print; +
//- Который принимаете параметры и выводит их в консоль; +
//- Который принимает и возвращает параметры;
//- Который принимает замыкание и распечатывает результаты в консоль.

class taskMetods {
    
    func empty() {
        print("Просто выводим сообщение")
    }
    
    func getParameters(name: String, age: Int) {
        print("Моего друга зовут \(name) и ему \(age)")
    }
    
    func myFavMovies (number: Int) -> [Int] {
        var numbersArrayEven = [Int]()
        if number % 2 == 0 { //если переданное число делится на 2 без остатка, то кидаем его в массив
            numbersArrayEven.append(number)
        } else {
            print("Число \(number) нечетное")
        }
        
        return numbersArrayEven
    }
    
    func getClosure(a: Int, b: Int, nameClosure: (Int, Int) -> String) {
        let resultClosure = nameClosure(a,b)
        print("\(resultClosure)")
    }
    
}

let task = taskMetods()
print(task.myFavMovies(number: 11))
task.empty()
task.getParameters(name: "Лёша", age: 28)
task.myFavMovies(number: 10)
task.getClosure(a: 1, b: 2, nameClosure: {a, b in "\(a) + \(b)"})
