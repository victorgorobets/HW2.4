import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userDescription: UILabel!
    
    // Закомментировано,т.к. не удалось передать данные с LoginViewController
    // var userInfo: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   //     userDescription.text = userInfo
    }
}
