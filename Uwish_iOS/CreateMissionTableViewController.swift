import UIKit

class CreateMissionTableViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var budgetTextField: UITextField!
    @IBOutlet weak var budgetHintLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    var pickerType = 1
    
    @IBOutlet var categoryPickerView: UIPickerView!
    @IBOutlet var categoryPickToolBar: UIToolbar!
    let categories = ["買東西", "遛狗", "清潔", "搬家", "快遞", "煮飯"]
    
    @IBOutlet var dueDatePicker: UIDatePicker!
    @IBOutlet var datePickerToolBar: UIToolbar!
    
    @IBOutlet var cityPickerToolBar: UIToolbar!
    @IBOutlet var cityPickerView: UIPickerView!
    
    @IBOutlet var imageButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        addressTextField.delegate = self
        budgetHintLabel.text = ""
        
        categoryTextField.inputView = categoryPickerView
        categoryTextField.inputAccessoryView = categoryPickToolBar
        categoryTextField.tintColor = UIColor.clear // 游標顏色（無色）
        
        dateTextField.inputView = dueDatePicker
        dateTextField.inputAccessoryView = datePickerToolBar
        dateTextField.tintColor = UIColor.clear
        
        cityTextField.inputView = cityPickerView
        cityTextField.inputAccessoryView = cityPickerToolBar
        cityTextField.tintColor = UIColor.clear
        
        detailTextView.layer.borderWidth = 1
        detailTextView.layer.cornerRadius = 6
        detailTextView.layer.borderColor = UIColor.systemGray3.cgColor

    }
    
    // 按return鍵收鍵盤
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func clickCategory(_ sender: Any) {
        pickerType = 1
    }
    @IBAction func clickCity(_ sender: Any) {
        pickerType = 2
    }
    
    @IBAction func selectCategory(_ sender: Any) {
        categoryTextField.text = categories[categoryPickerView.selectedRow(inComponent: 0)]
        view.endEditing(true)
    }
    
    @IBAction func selectDate(_ sender: Any) {
        dueDatePicker.minimumDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = dueDatePicker.locale
        dateFormatter.dateStyle = .medium
        let dateStr = dateFormatter.string(from: dueDatePicker.date)
        dateTextField.text = dateStr
        view.endEditing(true)
    }
    
    @IBAction func selectCity(_ sender: Any) {
        let c = cityPickerView.selectedRow(inComponent: 0)
        let d = cityPickerView.selectedRow(inComponent: 1)
        cityTextField.text = city[c] + district[c][d]
        view.endEditing(true)
        
    }
    
    @IBAction func showBudgetDetail(_ sender: Any) {
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.left
        let messageText = NSMutableAttributedString(string: "\n1. 發案金額上限為2000元。\n2. 扣點方式：依發案金額\n   1~50元：1點\n   52~100元：2點\n   101~150元：3點\n   依此類推...", attributes: [NSAttributedString.Key.paragraphStyle: style])
        let alertController = UIAlertController(title: "發案金額說明", message: "", preferredStyle: .alert)
        alertController.setValue(messageText, forKey: "attributedMessage")
        let ok = UIAlertAction(title: "我知道了", style: .default)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func checkBudget(_ sender: Any) {
        let budget = Int(budgetTextField.text ?? "") ?? 0
        var message = ""
        if budget <= 0 || budget > 2000 {
            message = "金額須介於1~2000元"
            budgetHintLabel.textColor = UIColor.red
        } else {
            message = "使用點數：\((budget+49)/50)點"
            budgetHintLabel.textColor = UIColor.black
        }
        budgetHintLabel.text = message
    }
    
    @IBAction func uploadImage(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "照片上傳", message: "請選擇圖片來源", preferredStyle: .alert)
        let camera = UIAlertAction(title: "相機", style: .default) { (alertAction) in
            print("camera")
        }
        
        let album = UIAlertAction(title: "相簿選取", style: .default) { (alertAction) in
            print("album")
        }
        
        alertController.addAction(camera)
        alertController.addAction(album)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CreateMissionTableViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerType == 1 {
            return 1
        } else {
            return 2
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerType == 1 {
            return categories.count
        } else {
            if component == 0 {
                return city.count
            } else {
                let cityNumber = cityPickerView.selectedRow(inComponent: 0)
                return district[cityNumber].count
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerType == 2 && component == 0 {
            cityPickerView.reloadComponent(1)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerType == 1 {
            return categories[row]
        } else {
            if component == 0 {
                return city[row]
            } else {
                let cityNumber = cityPickerView.selectedRow(inComponent: 0)
                return district[cityNumber][row]
            }
        }
    }
}
