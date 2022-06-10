//
//  WelcomeViewController.swift
//  LoginApp (SwiftBookDZ)
//
//  Created by Vlad Sytnik on 03.06.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var welcomeLabel: UILabel!
    static var textLabel: String = "test"
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = WelcomeViewController.textLabel
    }
    

    //MARK: - Actions
    @IBAction func LogOutButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
