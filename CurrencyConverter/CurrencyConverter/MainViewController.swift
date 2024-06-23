import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var euroSwitch: UISwitch!
    @IBOutlet weak var yenSwitch: UISwitch!
    @IBOutlet weak var poundSwitch: UISwitch!
    @IBOutlet weak var cadSwitch: UISwitch!
    
    var errorMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
    }
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let amountText = amountTextField.text, let amount = Int(amountText) else {
            errorMessage = "Please enter a valid integer amount in USD."
            performSegue(withIdentifier: "showResult", sender: nil)
            return
        }
        
        errorMessage = nil
        performSegue(withIdentifier: "showResult", sender: amount)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let destinationVC = segue.destination as! ResultViewController
            if let amount = sender as? Int {
                var selectedCurrencies = [String]()
                
                if euroSwitch.isOn {
                    selectedCurrencies.append("EUR")
                }
                if yenSwitch.isOn {
                    selectedCurrencies.append("JPY")
                }
                if poundSwitch.isOn {
                    selectedCurrencies.append("GBP")
                }
                if cadSwitch.isOn {
                    selectedCurrencies.append("CAD")
                }
                
                destinationVC.amount = amount
                destinationVC.selectedCurrencies = selectedCurrencies
            }
            destinationVC.errorMessage = errorMessage
        }
    }
}
