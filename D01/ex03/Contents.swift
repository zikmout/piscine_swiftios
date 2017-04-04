//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, ex00 !\n"
print(str)

enum Color : String {
    case spade = "Spade"
    case club = "Club"
    case heart = "Heart"
    case diamond = "Diamond"
    static let allColors = [spade, club, heart, diamond]
}

for f in Color.allColors {
    print(f.rawValue)
}

enum Value : Int {
    case two = 1
    case three = 2
    case four = 3
    case five = 4
    case six = 5
    case seven = 6
    case eight = 7
    case nine = 8
    case ten = 9
    case jack = 10
    case queen = 11
    case king = 12
    case ace = 13
    static let allValues = [two, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace]
}

for t in Value.allValues {
    print(t.rawValue)
}

class Card : NSObject {
    var color: Color
    var value: Value
    init(color:Color, value:Value) {
        self.color = color
        self.value = value
    }
    override var description: String {
        return "card color -> \(color.rawValue), card value ->\(value.rawValue)"
    }
    override func isEqual(_ object: Any?) -> Bool {
        if let object = object as? Card {
            if color == object.color && value == object.value
            {
                return true
            }
            else
            {
                return false
            }
        }
        else {
            return false
        }
    }
}

let card1 = Card(color : Color.spade, value : Value.ace)
let card2 = Card(color : Color.diamond, value : Value.two)

//print(card1)
//print(card2)

//print(card1 == card2)

class Deck: NSObject {
    
    var allSpades : [Card]
    let allDiamonds : [Card]
    let allHearts : [Card]
    let allClubs : [Card]
    let allCards : [Card]
    
    override init() {
        
        var tmpSpades = [Card]()
        var tmpDiamonds = [Card]()
        var tmpHearts = [Card]()
        var tmpClubs = [Card]()
        var tmpAllCards = [Card]()
        
        for y in Value.allValues {

            tmpSpades.append(Card(color: Color.spade, value: y))
            tmpDiamonds.append(Card(color: Color.diamond, value: y))
            tmpHearts.append(Card(color: Color.heart, value: y))
            tmpClubs.append(Card(color: Color.club, value: y))

        }
        allSpades = tmpSpades
        allDiamonds = tmpDiamonds
        allHearts = tmpHearts
        allClubs = tmpClubs

        tmpAllCards.append(contentsOf: tmpSpades)
        tmpAllCards.append(contentsOf: tmpDiamonds)
        tmpAllCards.append(contentsOf: tmpHearts)
        tmpAllCards.append(contentsOf: tmpClubs)

        allCards = tmpAllCards
    }

}

extension Deck {
    func shuffle(play: [Card]) -> [Card] {
        print(arc4random_uniform(UInt32(7)))
        return play
    }
}

import Darwin // required for arc4random_uniform

extension Array {
    
    mutating func shuffle() {
        var indexArray = Array<Int>(indices)
        var index = indexArray.endIndex
        
        let indexIterator = AnyIterator<Int> {
            guard let nextIndex = indexArray.index(index, offsetBy: -1, limitedBy: indexArray.startIndex)
                else { return nil }
            
            index = nextIndex
            let randomIndex = Int(arc4random_uniform(UInt32(index)))
            if randomIndex != index {
                swap(&indexArray[randomIndex], &indexArray[index])
            }
            
            return indexArray[index]
        }
        
        self = indexIterator.map { self[$0] }
    }
    
}



var newDeck = Deck()
//newDeck.shuffle(play:newDeck.allClubs)
//print(newDeck.allSpades)
//print(newDeck.allDiamonds)
//print(newDeck.allHearts)
//print(newDeck.allClubs)
//print("*****")
//print(newDeck.allCards)
//print(newDeck.allSpades)
newDeck.allSpades.shuffle()
print(newDeck.allSpades)

