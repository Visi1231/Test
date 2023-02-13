import UIKit

final class PayScreenVC: UIViewController {

    weak var payScreenView: PayScreenView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = PayScreenView(frame: UIScreen.main.bounds)
    }

}

