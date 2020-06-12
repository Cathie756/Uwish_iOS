
import UIKit

class MissionPostedViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var missionTableView: UITableView!
    var missions = [Mission]()
    
    let userId = 2 // 使用者Id
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showMissions()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showMissions(){
        
        
        NetworkController.shared.fetchMissions(userId: 2) { (missions) in
            if let missions = missions {
                self.missions = missions
                DispatchQueue.main.async {
                    self.missionTableView.reloadData()
                }
            }
            
        }
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MissionTableViewCell", for: indexPath) as! MissionTableViewCell
        
        let mission = missions[indexPath.row]
        cell.titleLabel.text = mission.title

        
        return cell
    }
    
    
    
    
}

