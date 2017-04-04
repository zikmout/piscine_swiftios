import Foundation
class Deck: NSObject {

    let allSpades : [Card]
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
