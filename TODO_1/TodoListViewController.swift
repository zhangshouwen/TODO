//
//  ViewController.swift
//  TODO_1
//
//  Created by 张守文 on 2019/1/5.
//  Copyright © 2019 Zhang Shouwen. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let var itemArray = ["购买水杯","吃药","修改密码"]
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for:indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        
        
        
        
        let alert = UIAlertController(title: "添加一个新的TODO项目", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "添加项目", style: .default) { (action) in
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "创建一个新项目..."
            textField = alertTextField
        }
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

