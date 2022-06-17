import Foundation

struct Activity{
    
    //MARK: Propiedades
    var activities: Categories
    var precio: Price

    
    //MARK: Metodos
    func randomCategories(_ activity: String) -> Categories? {
        return Categories.allCases.first{ "\($0)" == activity}
    }
    
}

