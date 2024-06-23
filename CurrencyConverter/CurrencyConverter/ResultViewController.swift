import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var usdAmountLabel: UILabel!
    
    var amount: Int = 0
    var selectedCurrencies: [String] = []
    var errorMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTextView.textAlignment = .center
        usdAmountLabel.textAlignment = .center
        displayResults()
    }
    
    func displayResults() {
        if let errorMessage = errorMessage {
            usdAmountLabel.text = errorMessage
            resultTextView.text = ""
            return
        }
        
        usdAmountLabel.text = "Amount in USD: \(amount)"
        
        var resultsText = ""
        
        for currency in selectedCurrencies {
            let convertedAmount = CurrencyConverter.convert(usd: amount, to: currency)
            resultsText += "\(currency)\t\(String(format: "%.2f", convertedAmount))\n\n"
        }
        
        // Create a paragraph style with tab stops
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 150)]
        
        let attributedString = NSMutableAttributedString(string: resultsText)
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        
        resultTextView.attributedText = attributedString
    }
}
