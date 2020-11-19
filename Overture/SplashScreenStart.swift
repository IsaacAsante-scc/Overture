//
//  SplashScreenStart.swift
//  Overture
//
//  Created by Isaac Asante on 2020-10-18.
//

import UIKit

class SplashScreenStart: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var logoLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Dismiss view controller after 3 secs and call function
        logoAnimate()
        perform(#selector(self.showTabController), with: nil, afterDelay: 3)
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Functions and Methods
    // Method to create segue to showStartScreen view controller
    @objc func showTabController() {
        performSegue(withIdentifier: "showStartScreen", sender: self)
    }
    
    // Method to animate logo image view
    func logoAnimate() {
        UIView.animate(withDuration: 2) {
            self.logoImage.frame = CGRect(x: 0, y: 0, width: -200, height: -200)
            self.logoImage.center = self.view.center
        }
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
