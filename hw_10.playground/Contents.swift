/* //ДЗ 10 - Замыкания / closure
//
//Написать сортировку массива с помощью замыкания, сначала по возрастанию, затем по убыванию. Вывести всё в консоль.
let numbers = [1, 20, 3, 4, 510]
var sortNumbers = numbers.sorted {$0 < $1}
var sortNumber2 = numbers.sorted {$0 > $1}
print(sortNumbers)
print(sortNumber2)

//Создать метод который запрашивает имена друзей, после этого имена кладет в массив, сортирует этот массив по количеству букв в имени и возвращает результат - отсортированный массив

var friends: [String] = []

func nameFriend(name: String) {
 friends.append(name)
    var sortFriends = friends.sorted {($0.count > $1.count)}
    print(sortFriends)
}

nameFriend(name: "Kri")
nameFriend(name: "Alina")
nameFriend(name: "Emilia")
nameFriend(name: "Ingeborge")

//Написать функцию, которая будет принимать ключи, выводить ключи и значения словаря (Dictionary). Тип ключа и значения выбирайте сами

//решение 1
var dictKey: [String: Int] = ["Age1": 2023, "Age2": 2024]

func getKey(keys: String) {
    for (key, value) in dictKey {
        if dictKey .isEmpty {
            print("Словарь пустой")
        } else if key == keys {
            print("Ключ \(key), значение \(value)")
        } else {
            print("Ключ \(key) не равен \(keys)")
        }
    }
}
getKey(keys: "Age1")

//Решение 2
var dictKey2: [String: Int] = ["Age1": 2023, "Age2": 2024]

func getKey(keys: [String]) {
    for key in keys {
        if dictKey2[key] == nil {
            print("Ключа \(key) нет в словаре")
            continue
        }
        print("Ключ \(key) имеет значение - \(dictKey2[key]!)")
    }
}
getKey(keys: ["Age1", "spasibo dura", "privet"])
*/
//Написать функцию, которая принимает пустые массивы(один - строковый, второй - числовой) и проверяет их: если пустой - то добавить значения (любые) и вывести в консоль.

var arrayString: [String] = []
var arrayInt: [Int] = []



//
//for elInt in arrayInt, arrayString {
//    if arrayInt .isEmpty {
//        arrayInt.append([1, 2, 3, 4, 5])
//    }
//}
