//ДЗ 11 - Перечисления / enum

//Создайте по 1-2 enum разных типов. Можно брать примеры из жизни. Тип дня .day, .night

enum Profile {
    case subscription
    case autorisation
    case balance
    case help
    case about
    case settings
    enum paymentMethods {
        case card
        case sberpay
        case sbp
        case qiwi
    }
    case purchase
}


enum Genres {
    case horror
    case comedy
    case drama
    case action
    case detective
}

//Создать несколько своих enum, названия какие хотите: например, анкета сотрудника - пол, возраст, ФИО, стаж

enum Tee {
    case green
    case black
    case red
    case white
}

//Создать enum со всеми цветами радуги
enum Rainbow {
    case red
    case orange
    case yellow
    case green
    case blue
    case indigo
    case violet
}

//Создать enum оценок, а затем функцию, которая будет принимать этот enum и печатать в консоль какую оценку получил ученик

enum Grade {
    case A
    case B
    case C
    case D
    case F
}

var myGrade = Grade.C

func gradeStudent(_ grade: Grade) {
    
    switch myGrade {
    case .A:
        print("Your grade is A")
    case .B:
        print("Your grade is B")
    case .C:
        print("Your grade is C")
    case .D:
        print("Your grade is D")
    case .F:
        print("Your grade is F")
    }
}

gradeStudent(myGrade)
//Создать программу, которая "рассказывает" - бренды автомобилей стоят в гараже
/*
enum myBox {
    case BMW
    case Porche
    case Lada
    case Mercedes
    case Mustang
}

var myAuto = myBox.Mustang

func car(_ auto: myBox) {
    switch myAuto {
    case .BMW:
        print("В моем гараже есть черный бумер")
    case .Lada:
        print("В моем гараже есть Lada")
    case .Mercedes:
        print("В моем гараже есть майбах")
    case .Mustang:
        print("В твоем гараже есть крутой форд мустанг")
    case .Porche:
        print("В твоем гараже есть порш")
    }
}

car(myAuto)


*/
enum myBox: String {
    case BMW = "BMV"
    case Porche = "Porche"
    case Lada = "Lada"
    case Mercedes = "Mercedes"
    case Mustang = "Mustang"
}


var arrayMyBox: [myBox] = [.BMW, .Lada, .Mercedes, .Mustang, .Porche]

    for auto in arrayMyBox {
        if arrayMyBox.isEmpty {
            print("Твой гараж пуст")
        } else {
        print("\("В моем гараже стоит \(auto)")")
        }
}
        

