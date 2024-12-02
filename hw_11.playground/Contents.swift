////ДЗ 11 - Перечисления / enum
//
////Создайте по 1-2 enum разных типов. Можно брать примеры из жизни. Тип дня .day, .night
// 1-й enum
enum Colors{
    case white
    case black
    case grey
    case yellow
    case green
}

//2-й enum

enum PaymentMethods {
    case card
    case cash
    case sbp
    case qr
}

////Создать несколько своих enum, названия какие хотите: например, анкета сотрудника - пол, возраст, ФИО, стаж

enum Genres {
    case horror
    case drama
    case documentary
    case Thriller
    case comedy
}

////Создать enum со всеми цветами радуги
enum Rainbow {
    case red
    case orange
    case yellow
    case green
    case blue
    case indigo
    case violet
}

////Создать enum оценок, а затем функцию, которая будет принимать этот enum и печатать в консоль какую оценку получил ученик
//
enum Grade {
    case A(String)
    case B
    case C
    case D
    case F
}

func gradeFunc(en: Grade) {
    switch en {
    case .A(let znak): // znak - связанное значение
        print("Ты получил оценка - 5 c \(znak)")
    case .B:
        print("Ты получил оценку - 4")
    case .C:
        print("Ты получил оценку - 3")
    case .D:
        print("Ты получил оценку - 2")
    case .F:
        print("Ты получил оценку - 1")
    }
}

gradeFunc(en: .A("+"))
gradeFunc(en: .F)



////Создать программу, которая "рассказывает" - бренды автомобилей стоят в гараже
///
///Решение  с помощью протокола CaseIterable
enum myBox: CaseIterable { //CaseIterable - протокол, который используется дл итерации над перечислениями
    case Porsche
    case Mercedes
    case Bentley
    case Lamborghini
    case Dodge
    case Mustang
}


    for auto in myBox.allCases {
        print("В моем гараже есть машина - \(auto)")
    }



///Решение  с помощью массива

enum myBoxArray: String {
    case BMW = "BMV"
    case Porche = "Porche"
    case Lada = "Lada"
    case Mercedes = "Mercedes"
    case Mustang = "Mustang"
}


var arrayMyBox: [myBoxArray] = [.BMW, .Lada, .Mercedes, .Mustang, .Porche]

    for auto in arrayMyBox {
        if arrayMyBox.isEmpty {
            print("Твой гараж пуст")
            } else {
        print("\("В моем гараже стоит \(auto)")")
        }
}
