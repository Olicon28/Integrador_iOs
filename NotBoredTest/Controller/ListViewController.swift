import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var activities : [String] = ["Education", "Recreational", "Social", "Diy", "Charity", "Coocking", "Relaxation", "Music", "Busywork"]
   
    @IBOutlet weak var activityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityTableView.dataSource = self
        activityTableView.delegate = self
        activityTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : BasicTableViewCell = activityTableView.dequeueReusableCell(withIdentifier: "CeldaBasicaPlantilla", for: indexPath) as! BasicTableViewCell
        
        
        cell.activityLabel.text  = activities[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        
        let actividad = activities[indexPath.row]
        print(actividad)
        Participants.shared.actividadSeleccionada = actividad
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ListView" {
            let objPantalla:ShowActivityViewController = segue.destination as! ShowActivityViewController
        }
    }
    
    
    @IBAction func onTapClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func onTapActivity(_ sender: Any) {
        
    }
    
    
}
