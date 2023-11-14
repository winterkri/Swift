//ДЗ 8 - Switch / if else / for each
//
//Создать цикл в цикле. В первом цикле интервал до 200. Во втором цикле делаем так, как доходим до 15 элемента в первом цикле, выходим из двух циклов


looplabel: for num in 1...200 {
    for j in 1...15 {
        if num == 15 {
         break looplabel
        } else {
            print("Второй цикл \(j)")
        }
    }
 print("Первый цикл \(num)")
}



//Создать в if и отдельно в switch программу которая будет смотреть на возраст человека и говорить куда ему идти в школу, в садик, в универ, на работу, на пенсию и тд

// в if

for age in 1...100 {
    if age < 7 {
        print("Дуй в садик тебе еще \(age)")
    } else if age >= 7 && age < 18 {
        print("Дуй в школу, тебе \(age)")
    } else if age >= 18 && age < 24 {
        print("Дуй в универ, тебе \(age)")
    } else if age >= 24 && age < 60 {
        print("Дуй на работу, тебе уже \(age)")
    } else {
        print("Дуй на пенсию, тебе \(age)")
    }
}

    
// Использую функцию
func napravlenie (age2: Int) -> String {
        if age2 < 7 {
            return "Дуй в садик тебе еще \(age2))"
        } else if age2 == 7 && age2 < 18 {
            return "Дуй в школу, тебе \(age2)"
        } else if age2 == 18 && age2 < 24 {
            return "Дуй в универ, тебе \(age2)"
        } else if age2 >= 24 && age2 < 60 {
            return "Дуй на работу, тебе уже \(age2)"
        } else {
            return "Дуй на пенсию, тебе \(age2)"
        }
}
print(napravlenie(age2: 45))

// через switch

let age4 = 590

switch age4 {
case 1...6:
    print("Дуй в садик тебе еще \(age4)")
case 7...17:
    print("Дуй в школу, тебе \(age4)")
case 18...23:
    print("Дуй в универ, тебе \(age4)")
case 24...59:
    print("Дуй на работу, тебе уже \(age4)")
case 60...100:
    print("Дуй на пенсию, тебе \(age4)")
default:
    print("Я тебя не поняла")
}

//Создать все циклы for in которые знаете
// ---/ Итерация по строке /----
let str = "I love swift"
for char in str {
    print(char)
}

// ---/ итерация по массиву /---
let array = [1, 2, 3, 4, 5, 6, 7]
for index in array {
    print(index)
}

// ---/ Итерация по словарю /---
let dictOS = ["Apple": "IOS", "Google": "Android", "Microsoft": "Windows"]
for os in dictOS {
    print(os.key)
}

// --/ Итерация по диапазону /--
for i in 0...10 {
    print(i)
}
//В switch и отдельно в if создать систему оценивания школьников по 12 бальной системе и и высказывать через print мнение

// с if
func gradeFunc (grade: Int) -> String {
    if grade >= 10 && grade <= 12  {
       // print("Отлично")
        return "Отлично"
    } else if grade >= 7 && grade <= 9 {
       // print("Хорошо")
        return "Хорошо"
    } else if grade >= 4 && grade <= 8 {
        //print("Удовлетворительно")
        return "Удовлетворительно"
    } else if grade >= 2 && grade <= 3 {
        //print("Плохо")
        return "Плохо"
    } else if grade == 1 {
        // print("Отчислен!")
        return "Отчислен!"
    } else {
       // print("Таких оценок нет")
        return "Таких оценок нет!"
    }
}
print(gradeFunc(grade: 5))

// c switch

let grade1 = 1

switch grade1 {
case 10...12:
    print("Отлично")
case 7...9:
    print("Хорошо")
case 4...8:
    print("Удовлетворительно")
case 2...3:
    print("Плохо")
case 0...1:
    print("Отчислен!")
default:
    print("Таких оценок нет")
}


//Создать массив(без тюплов / кортежей) с именами всех членов вашей семьи включая родственников, чтобы количество имен было не менее 10 и отсортируйте, распечатайте по алфавиту их в консоль

let arrayFamily = ["Svetlana", "Tatyana", "Alina", "Elena", "Victor", "Gabriella", "Lida", "Vitaly", "Veronica", "Viktorya", "Danil", "Alexey"]
//print(arrayFamily.sorted()) //можно вывести массивом
for family in arrayFamily.sorted() {
    print(family)
}
