//
//  AddItemViewController.swift
//  CoreDataSwift3
//
//  Created by Macbook on 28/12/2016.
//  Copyright © 2016 Chappy-App. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
     @IBOutlet weak var itemTextField: UITextField!

     override func viewDidLoad() {
        super.viewDidLoad()
     
     }
     
     @IBAction func buttonTapped(_ sender: UIButton) {
     
          let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
          
          let item = Item(context: context) // Link Item & Context
          
          item.name = itemTextField.text!
          
     // Save the data to coredata
     
     (UIApplication.shared.delegate as! AppDelegate).saveContext()
     
     let _ = navigationController?.popViewController(animated: true)
     
     
     }
     
}
