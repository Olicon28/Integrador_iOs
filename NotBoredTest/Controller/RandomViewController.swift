import UIKit
import Alamofire

class RandomViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueTypeLabel: UILabel!
    @IBOutlet weak var valuePriceLabel: UILabel!
    @IBOutlet weak var valueParticipantsLabel: UILabel!
    
    @IBOutlet weak var tryAnotherButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRandomEvent()
        
    }
    

        // Do any additional setup after loading the view.
    @IBAction func onTap(_ sender: Any) {
        getRandomEvent()
    }
    
    func getRandomEvent() -> Void{
        
        /*AF.request("", method: .post,  parameters: parameters, encoding: JSONEncoding.default)
                .responseJSON { response in
                    switch response.result {
                        case .success(let value):
                            if let json = value as? [String: Any] {
                                print(json["Result"] as? Int)
                            }
                        case .failure(let error):
                            print(error)
                    }
            }*/
        
        
        AF.request("http://www.boredapi.com/api/activity/").response {respuesta in
            debugPrint("respuesta: ", respuesta)
            
            
                    
            guard let data = respuesta.data else {
                        print("no hay data")
                        return
                    }
            
                    debugPrint("data: ", data)
                    
                    do {
                        
                        let result = try JSONDecoder().decode(Response.self, from: data)
                        
                        debugPrint("result: ", result)
      
                        
                        
                        self.valueParticipantsLabel.text = String(result.participants)
                        self.valueTypeLabel.text = String(result.type)
                        
                        
                        
                        if(result.price == 0.0){
                            self.valuePriceLabel.text = "Free"
                        }else if(result.price > 0 && result.price < 0.3){
                            self.valuePriceLabel.text = "Low"
                        }else if(result.price > 0.3 && result.price < 0.6){
                            self.valuePriceLabel.text = "Medium"
                        }else if(result.price > 0.6){
                            self.valuePriceLabel.text = "High"
                        }
                        
                        self.titleLabel.numberOfLines = 0
                        self.titleLabel.lineBreakMode = .byWordWrapping
                        self.titleLabel.text = result.activity
                        self.titleLabel.textAlignment = .center
                        
                        
                        return
                        
                        
                    }
                    catch let error {
                        print("Se produjo un error: \(error)")
                    }
            
                    return
                }
        
        
        
    }

}
