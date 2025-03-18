import Foundation

// 1. Создание класса родителя и 2 классов наследника
class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("Animal sound")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("Woof-woof!")
    }
}

class Cat: Animal {
    override func makeSound() {
        print("Meow-meow!")
    }
}

// 2. Класс House
class House {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func create() -> Double {
        let area = width * height
        print("Площадь дома: \(area) квадратных метров")
        return area
    }
    
    func destroy() {
        print("Дом уничтожен")
    }
}

// 3. Класс для сортировки массива учеников
class StudentSorter {
    func sortByName(students: [String]) -> [String] {
        return students.sorted()
    }
    
    func sortByLength(students: [String]) -> [String] {
        return students.sorted { $0.count < $1.count }
    }
}

// 4. Структура и класс
struct Point {
    var x: Int
    var y: Int
}

class Circle {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
}

// 5. Программа для покера
enum Suit: String {
    case hearts = "♥️"
    case diamonds = "♦️"
    case clubs = "♣️"
    case spades = "♠️"
}

enum Rank: String {
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "J"
    case queen = "Q"
    case king = "K"
    case ace = "A"
}

struct Card {
    var suit: Suit
    var rank: Rank
}

class PokerGame {
    var deck: [Card] = []
    
    init() {
        createDeck()
    }
    
    func createDeck() {
        for suit in [Suit.hearts, Suit.diamonds, Suit.clubs, Suit.spades] {
            for rank in [Rank.two, Rank.three, Rank.four, Rank.five, Rank.six, Rank.seven, Rank.eight, Rank.nine, Rank.ten, Rank.jack, Rank.queen, Rank.king, Rank.ace] {
                deck.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    func drawHand() -> [Card] {
        let hand = Array(deck.shuffled().prefix(5))
            for card in hand {
            print("\(card.rank.rawValue)\(card.suit.rawValue)")
            }
        return hand
    }
    
    func evaluateHand(hand: [Card]) {
        // Пример простой проверки на флеш
        let suits = hand.map { $0.suit }
        let ranks = hand.map { $0.rank }
        
        if Set(suits).count == 1 {
            print("У вас флеш: \(hand.map { "\($0.rank.rawValue) \($0.suit.rawValue)" }.joined(separator: ", "))")
        } else {
            print("У вас не флеш.")
        }
    }
}

// Пример использования
let house = House(width: 10, height: 20)
house.create()
house.destroy()

let students = ["Ilia", "Katerina", "Alexei", "Anastasia"]
let sorter = StudentSorter()
print("Отсортированные по имени: \(sorter.sortByName(students: students))")
print("Отсортированные по длине имени: \(sorter.sortByLength(students: students))")

let pokerGame = PokerGame()
let hand = pokerGame.drawHand()
pokerGame.evaluateHand(hand: hand)
