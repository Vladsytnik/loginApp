//
//  MoreInfoViewController.swift
//  LoginApp (SwiftBookDZ)
//
//  Created by Vlad Sytnik on 03.06.2022.
//

import UIKit

class MoreInfoViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    static var textLabel = ""
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = MoreInfoViewController.textLabel
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
