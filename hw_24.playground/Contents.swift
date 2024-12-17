//ДЗ 24 - Json / Encodable / Decodable / Codable
//
//В этом ДЗ не будет ролика. Необходимо найти информацию в интеренете о json кодировании данных в Swift
//Попробовать сдекодить модельку (структуру) в json (с вложенными структурами). Распечать это в консоль


/*
 1.    Кодирование (Encoding)
Это процесс преобразования объекта в формат, который можно сохранить или передать (например, в JSON).
Это как перевести ваши записки на понятный всем язык (например, JSON).
 2.    Декодирование (Decoding)
Это обратный процесс: мы берем JSON (или другой формат) и превращаем его обратно в объект.
Это как прочитать перевод записок и восстановить оригинальную информацию.
 */

import Foundation

enum Animals: String, Encodable { //Encodable позволяет преобразовать значения этого перечисления в JSON
    case dog
    case cat
    case homik
}

struct Pets: Encodable { // Encodable потому мы хотим структуру перевести в JSON
    let name: String
    let age: Int
    let pet: Animals
}

let myPet = Pets(name: "Betty", age: 2, pet: .dog)


do {
    let jsonData = try JSONEncoder().encode(myPet) //JSONEncoder, преобразовывает объект myPet в JSON, try означает, что кодирование может вызвать ошибку (например, если объект не соответствует Encodable), encode(myPet) кодирует объект в данные (Data), которые представляют JSON.
    if let jsonString = String(data: jsonData, encoding: .utf8) { /// Преобразуем данные jsonData в строку (String) с использованием кодировки UTF-8
        print(jsonString)
    }
}
catch {
    print("Failed \(error)") // Если происходит ошибка (например, объект myPet не поддерживает кодирование), мы её отлавливаем и выводим сообщение
}


//Попробовать декодировать модельку из json в структуру

enum Animals2: String, Decodable { //String означает, что каждому случаю будет присвоено строковое значение, например, Animals.dog станет "dog"
    case dog
    case cat
    case homik
}

struct Pets2: Decodable { // Decodable потому мы хотим JSON перевести в структуру
    let name: String
    let age: Int
    let pet: Animals2
}

let jsonString2 = """
{
   "name":"Betty",
   "age":2,
   "pet":"dog"
}
"""

if let jsonData2 = jsonString2.data(using: .utf8) { // Преобразуем строку jsonString2 в данные (Data) с использованием UTF-8, чтобы можно было декодировать её.
    do {
        let pets2 = try JSONDecoder().decode(Pets2.self, from: jsonData2) //Pets2.self указывает, что мы хотим получить объект типа Pets2.
        print(pets2)
    }
    catch {
        print("Failed \(error)")
    }
}

//Сделать структуру Codable и вначале декодировать структуру, а потом создать структуру того же типа и декодировать ее

struct Songs: Codable {
    let singer: String
    let nameSong: String
}

let jsonString3 = """
{
"singer": "Pomme",
"nameSong": "Ma Meilleure Ennemie"
}
"""

if let jsonData3 = jsonString3.data(using: .utf8) {
    do {
        let songs = try JSONDecoder().decode(Songs.self, from: jsonData3)
        print(songs)
    }
    catch {
        print("Error \(error)")
    }
}

let favSong = Songs(singer: "Pomme", nameSong: "Ma Meilleure Ennemie")

do {
    let jsonData4 = try JSONEncoder().encode(favSong)
    if let jsonString4 = String(data: jsonData4, encoding: .utf8) {
        print(jsonString4)
    }
}
catch {
    print("Error, \(error)")
}


