import Foundation

class StructActivity:Decodable {
    //MARK: Propiedades
        var activity: String
        var type: String
        var participants: Int
        var price: Double
        var link: String
        var key: String
        var accessibility: Double
    
    //MARK: Inicializadores
    init(activity: String, type: String, participants: Int, price: Double, link: String, key: String, accessibiity: Double){
        self.activity = activity
        self.type = type
        self.participants = participants
        self.price = price
        self.link = link
        self.key = key
        self.accessibility = accessibiity
    }
}
