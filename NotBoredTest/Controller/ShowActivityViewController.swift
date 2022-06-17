import UIKit
import Alamofire

class ShowActivityViewController: UIViewController {

    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var respuestaActividadLabel: UILabel!
    @IBOutlet weak var participantesTextField: UITextField!
    @IBOutlet weak var tituloActividadSeleccionada: UILabel!
    
    var participantes:String = String()
    var precio:String = String()
    var actividad:String = String()
    var tituloGlobal:String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        tituloGlobal = Participants.shared.actividadSeleccionada
        print("tituloGlobal - " + tituloGlobal)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
//        tituloActividadSeleccionada.text = tituloGlobal
        cargarInfo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
//        tituloActividadSeleccionada.text = tituloGlobal
        cargarInfo()
    }

    @IBAction func tryAnother(_ sender: Any) {
        cargarInfo()
    }
    
    func consumirAPI(tipo:String)
    {
        let requestAUX = "http://www.boredapi.com/api/activity?type=" + tipo
        
        AF.request(requestAUX).response { [self]respuesta in
//            debugPrint(respuesta)
            
            guard let data = respuesta.data else {
                print("no hay data")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(StructActivity.self, from: data)
                //print(result)
                print("Actividad: " + result.activity)
                print("Precio: \(result.price)")
                print("Participantes: \(result.participants)")
                
                precio = String(result.price)
                participantes = String(result.participants)
                actividad = result.activity
//                tituloGlobal = result.type
                tituloActividadSeleccionada.text = result.type
            }
            catch let error {
                print("Se produjo un error: \(error)")
            }
        }
    }
    @IBAction func onTapCerrar(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    func cargarInfo() {
        
        
        
        consumirAPI(tipo: Participants.shared.actividadSeleccionada.lowercased())
        print("en consumir api: " + Participants.shared.actividadSeleccionada.lowercased())
        respuestaActividadLabel.text = actividad
        priceTextField.text = precio
        
        if Participants.shared.cantParticipants > 1 {
            participantesTextField.text = String(Participants.shared.cantParticipants)
        }
        else {
            participantesTextField.text = participantes
        }
        
    }
}
