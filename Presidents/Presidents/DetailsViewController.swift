//
//  DetailsViewController.swift
//  Presidents
//
//  Created by Georgios Loulakis on 21/1/23.
//

import UIKit

class DetailsViewController: UIViewController {

    //7
    var presidentName: String = ""
    
    //8
    @IBOutlet weak var presidentsName: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //9
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presidentsName.text = presidentName
    }
    
    // return button
    @IBAction func doneButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
