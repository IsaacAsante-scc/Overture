//
//  SplashScreenStart.swift
//  Overture
//
//  Created by Isaac Asante on 2020-10-18.
//

import UIKit

class SplashScreenStart: UIViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        perform(#selector(self.showTabController), with: nil, afterDelay: 3)
        self.dismiss(animated: true, completion: nil)
    }
    
   
    
    @objc func showTabController() {
        performSegue(withIdentifier: "showStartScreen", sender: self)
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
