import UIKit

class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var participantesTextField: UITextField!
    @IBOutlet weak var termConditionSwitch: UISwitch!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var rangoPrecioPicker: UIPickerView!
    
    let rango:[String] = ["Seleccionar...","Free","Low","Medium","High"]
    
    //var cantParticipantesGlobal = 0
    var termCondOKGlobal:Bool = false
    var rangoGlobalSeleccionado:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.dismissKeyboard))
                
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        rangoPrecioPicker.dataSource = self
        rangoPrecioPicker.delegate = self
    }

    @objc func dismissKeyboard() {
    //Las vistas y toda la jerarquía renuncia a responder, para esconder el teclado
           view.endEditing(true)
    }
    
    @IBAction func onChangeSitchTerms(_ sender: Any) {
        
        if termConditionSwitch.isOn {
            termCondOKGlobal = true
            onStartActivate()
        }
        else {
            termCondOKGlobal = false
            onStartActivate()
        }
    }
    @IBAction func onChangeParticipantes(_ sender: Any) {
        
        guard let cantParticipantesText = participantesTextField.text, cantParticipantesText.count > 0 else {
            startButton.isEnabled = false
            return
        }
        
        let cantParticipantes:Int = Int(cantParticipantesText) ?? 0
        //cantParticipantesGlobal = cantParticipantes
        Participants.shared.cantParticipants = cantParticipantes
        
        if cantParticipantes > 0
        {
            onStartActivate()
        }
    }
    
    @IBAction func onTapStart(_ sender: Any) {
        
        if Participants.shared.cantParticipants == 0 {
            alertaAviso(mensaje: "Cantidad Participantes es requerido")
        }
        else {
            if rangoGlobalSeleccionado == "" || rangoGlobalSeleccionado == "Seleccionar..." {
                alertaAviso(mensaje: "Debe seleccionar rango de precios")
            }
            else {
                //alertaAviso(mensaje: "Bien, rango seleccionado \(rangoGlobalSeleccionado)")
                /*let tercerView = self.navigationController?.viewControllers.first(where: { viewController in
                    if viewController is tabBarController {
                        return true
                    }
                    else {
                        return false
                    }
                })
                
                if let vController = tercerView {
                    self.navigationController?.popToViewController(vController, animated: true)
                }*/
            }
        }
    }
    @IBAction func onTapTermAndCondition(_ sender: Any) {
        print("Boton terminos y condiciones")
    }
    
    func onStartActivate () {
        
        if termCondOKGlobal == true && Participants.shared.cantParticipants > 0 {
            startButton.isEnabled = true
        }
        else{
            startButton.isEnabled = false
        }
        
    }
    
    func alertaAviso (mensaje:String)
    {
        let aviso = "AVISO"
        let entendido = "Entendido"
        let alert = UIAlertController(title: aviso, message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: entendido, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rango.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return rango[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print("\(rango[row])")
        rangoGlobalSeleccionado = rango[row]
    }
}

