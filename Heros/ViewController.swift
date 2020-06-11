//
//  ViewController.swift
//  Heros
//
//  Created by Marcelo Block Teixeira on 05/06/20.
//  Copyright © 2020 Marcelo Block Teixeira. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var tfHeroi: UITextField!
    var apiMarvel = ApiController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        tfHeroi.resignFirstResponder()
        
        let vc = segue.destination as! HerosTableViewController
        
        vc.name = tfHeroi.text
    }
     
    
}

