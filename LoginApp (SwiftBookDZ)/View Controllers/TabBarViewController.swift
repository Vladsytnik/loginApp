//
//  TabBarViewController.swift
//  LoginApp (SwiftBookDZ)
//
//  Created by Vlad Sytnik on 03.06.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultViewControllers()
    }
    

    //MARK: - Functions
    func setDefaultViewControllers() {
        let story = UIStoryboard(name: "Main", bundle: nil)

        let vc = story.instantiateViewController(withIdentifier: "WelcomeViewController")
        let vc2 = story.instantiateViewController(withIdentifier: "MoreInfoViewController")
        
        self.setViewControllers([vc2, vc], animated: true)
        self.selectedViewController = vc
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
