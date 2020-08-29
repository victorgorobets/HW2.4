import UIKit

class WelcomeViewController: UIViewController {
    
    var welcomeText = "Добро пожаловать, "
    
    @IBOutlet weak var welcomeMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeMessage.text = welcomeText
    }
}
