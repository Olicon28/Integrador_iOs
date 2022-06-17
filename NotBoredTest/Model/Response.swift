import Foundation

class Response: Decodable {
    //MARK: Atributos
    let activity:String
    let type:String
    let participants:Int
    let price:Double
    let link:String
    let key:String
    let accessibility:Double
    
    //MARK: Constructor
    init (activity:String, type:String, participants:Int, price:Double, link:String,  key:String, accessibility:Double) {
        
        self.activity = activity
        self.type = type
        self.participants = participants
        self.price = price
        self.link = link
        self.key = key
        self.accessibility = accessibility
    }
    
}
