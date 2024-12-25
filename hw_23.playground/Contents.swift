//ДЗ 23 -  Delegate / Паттерн делегат
//
//Создать 2 протокола:
//1.  "StartWriteCode" со свойствами: время, количество кода. И функцией writeCode()
//2. "EndWriteCode" с функцией: stopCoding()
//
//И класс: Разработчик, у которого есть свойства - количество программ написанных, специализация(ios, android, web может быть несколько). Разработчику подключаем два этих протокола.
//Задача: вывести в консоль сообщения - "Разработка началась. Пишем код" и "Работа закончена".


/*
 Делегатор - тот кто ставит задачу
 Тип делегата - протокл, который описывает какими свойствами и методами должен обладать делегат
 Делегат - тот, кто исполняет задачу
 */


protocol StartWriteCode {
    var time: Int { get set }
    var codeCount: Int { get set }
    
    func writeCode(time: Int)
}

protocol EndWriteCode {
    func stopCoding()
}

enum Specialization {
    case ios
    case android
    case web
}

class Developer: StartWriteCode, EndWriteCode {
    var time: Int
    var codeCount: Int
    var countApps: Int
    var specialization: [Specialization] = []
    var delegate: DeveloperDelegate?
    
    func writeCode(time: Int) {
        print("Разработка началась. Пишем код")
        for i in 1...time {
            self.time += 1
            self.codeCount += 10
            print("За \(i) минут написано \(self.codeCount) строчек кода")
        }
        stopCoding()
        countApps += 1
        print("Написано приложений: \(countApps). Код отдан на ревью")
        delegate?.review()
       
        }
    
    func stopCoding() {
        print("Работа закончена")
    }
    
    init(time: Int, codeCount: Int, countApps: Int, specialization: [Specialization], delegate: DeveloperDelegate) {
        self.time = time
        self.codeCount = codeCount
        self.countApps = countApps
        self.specialization = specialization
        self.delegate = delegate
    }
}

protocol DeveloperDelegate {
    func review()
}

class LeadDeveloper: DeveloperDelegate {
    func review() {
        print("Проверка кода")
    }
}
let lead = LeadDeveloper()
let dev = Developer(time: 0, codeCount: 0, countApps: 0, specialization: [.ios], delegate: lead)
dev.writeCode(time: 3)
dev.writeCode(time: 60)
dev.time
dev.countApps
dev.codeCount

