//ДЗ 19 - Приведение и проверка типов
//
//Сделать библиотеку книг и видео библиотеку фильмов
//Возможность добавлять новые книги и фильмы, после добавления должна происходить автоматическая сортировка по алфавиту



/* Немного теории
 Оператор is возвращает булевое значение, если, например, объект принадлежит определенному типу:
 
 for value in array {
 if value is A {
 acount += 1
 } итд
 }
_______
 Оператор as пытается присвоить перменной или константе сам объект
 
 if let a as A {
 
 }
 
 as бывает опциональным - as?
 if let a = value as? A { - это опшинл бандинг
 a.aa()
 }
 
 */
// Книжная библиотека
// Создаем перечисление с настроением
enum Moods: Int {
    case Great = 10
    case Good = 7
    case Bad = 2
    case neutral = 1
}


class Library {
    let name: String
    let author: [String]
    let year: Int
    let genre: String
    
    init(name: String, author: [String], year: Int, genre: String) {
        self.name = name
        self.author = author
        self.year = year
        self.genre = genre
    }
    var moodBooks: Moods {
        switch genre {
        case "Драма":
            return .Good
        case "Хоррор":
            return .Bad
        case "Романтические":
            return .Great
        case "Криминал":
            return .Bad
        default:
            return .neutral
        }
    }

}

// Видеобиблиотека
class VideoLibrary {
    let name: String
    let weight: Double
    let genre: String
    
    init(name: String, weight: Double, genre: String) {
        self.name = name
        self.weight = weight
        self.genre = genre
    }
    
    var mood: String {
            switch genre {
            case "Хоррор", "Триллер":
                return "плохое"
            case "Драма":
                return "осеннее"
            case "Комедия":
                return "хорошее"
            default:
                return "нет настроения"
            }
        }
    
}

//Для красивости запихну методы и массивы в отдельный класс
class MethodsAndArrays {
    var movies = [VideoLibrary]()
    var books = [Library]()
    
    func addBooks(obj: Library) {
        books.append(obj)
        books.sort { $0.name < $1.name } //Для себя напоминалка: здесь в замыкании указываем 2 соседних элемента
    }
    
    func addMovies(mov: VideoLibrary) {
        if !movies.contains(where: {$0.name == mov.name}) {
            movies.append(mov)
        } else {
            print("Такой фильм с названием \(mov.name) уже есть в библиотеке фильмов")
        }
        movies.sort { $0.name < $1.name } //Для себя напоминалка: здесь в замыкании указываем 2 соседних элемента
    }
    //Сделать так чтобы, когда я вызову метод (создайте сами его) - "sortByMood", то фильмы должны отсортировать по настроению
    //Такой же метод придумать для книг
    func sortByMood() {
        movies.sort { $0.mood < $1.mood } // сортируем по алфавиту от А до Я
    }
    
    //Метод сортировки книг по настроению
    func sortByMoodBooks() {
        books.sort { $0.moodBooks.rawValue > $1.moodBooks.rawValue } // сортируем по rawValue по убыванию
    }
    
}

//СОздаем экземпляр класса MethodsAndArrays
let object = MethodsAndArrays()

//Вызываем функцию добавления объектов типа Library в массив books
object.addBooks(obj: Library(name: "Кузнец", author: ["Мила Агапова"], year: 2024, genre: "Романтические"))
object.addBooks(obj: Library(name: "Артистка в цирке", author: ["Арина Иванова"], year: 2020, genre: "Драма"))
object.addBooks(obj: Library(name: "Враг у ворот", author: ["Михаил Агапов"], year: 2000, genre: "Хоррор"))
object.addBooks(obj: Library(name: "Яблоко раздора", author: ["Михаил Агапов"], year: 2002, genre: "Криминал"))
object.addBooks(obj: Library(name: "Американские мечты", author: ["Михаил Агапов"], year: 2002, genre: "Драма"))


////Вызываем функцию добавления объектов типа VideoLibrary в словарь movies
object.addMovies(mov: VideoLibrary(name: "Реинкарнация", weight: 2000.2, genre: "Драма"))
object.addMovies(mov: VideoLibrary(name: "Солнцестояние", weight: 1000.5, genre: "Триллер"))
object.addMovies(mov: VideoLibrary(name: "Сумерки", weight: 3047.5, genre: "Драма"))
object.addMovies(mov: VideoLibrary(name: "Убийство священного оленя", weight: 3045, genre: "Комедия"))
object.addMovies(mov: VideoLibrary(name: "Убийство священного оленя", weight: 3045, genre: "Комедия"))

//Печатаем массивы

for i in object.movies { print("\(i.name)") }
print("_____")
for i in object.books { print("\(i.name)") }

print("\nФильмы, отсортированные по настроению:")
object.sortByMood()
for i in object.movies { print("Фильм - \(i.name), настроение - \(i.mood)") }

print("\nКниги, отсортированные по настроению:")
object.sortByMoodBooks()
for i in object.books { print("Книга - \(i.name), настроение - \(i.moodBooks)") }


//Не обращаем на это внимание, просто решила вспомнить как класть в словарь объекты

//var allObjects: [String: AnyObject] = [:]
// func addBooks (obj: Library) {
//    allObjects["\(obj.name) - Книга"] = obj
//}
//
//func addVideo (obj: VideoLibrary) {
//    allObjects["\(obj.name) - Фильм"] = obj
//    allObjects.sorted { $0.key > $1.key }
//}
//func add(op1: Double, op2: Double) -> Double {
//    return op1 + op2
//}
//
//func subtract(op1: Double, op2: Double) -> Double {
//    return op1 - op2
//}
//

