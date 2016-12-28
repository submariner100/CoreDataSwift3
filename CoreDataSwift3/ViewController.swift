//
//  ViewController.swift
//  CoreDataSwift3
//
//  Created by Macbook on 28/12/2016.
//  Copyright © 2016 Chappy-App. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

     @IBOutlet weak var tableView: UITableView!
     
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     
     var items: [Item] = []
     

     override func viewDidLoad() {
          super.viewDidLoad()
          
          tableView.delegate = self
          tableView.dataSource = self
     }
     
     override func viewWillAppear(_ animated: Bool) {
     
          getData()
          tableView.reloadData()
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return items.count
          
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
          let cell = UITableViewCell()
          let item = items[indexPath.row]
          
          if let myName = item.name {
               cell.textLabel?.text = myName
               
          }
          
          return cell
     }
     
     func getData() {
          
          do {
               
          items = try context.fetch(Item.fetchRequest())
               
          } catch {
               
          print("Fetching Failed")
          
          }
     }

     
     
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     
          if editingStyle == .delete {
               
               let item = items[indexPath.row]
               
               context.delete(item)
               
               (UIApplication.shared.delegate as! AppDelegate).saveContext()
               
               do {
                    items = try context.fetch(Item.fetchRequest())
               } catch {
                    print("Fetching Failed")
               }
               
          }
          
          tableView.reloadData()
     }
}

