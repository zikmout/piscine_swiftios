import Foundation
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
