//
//  TodoListViewController.swift
//  RxTodoList
//
//  Created by HomerIce on 2017/6/18.
//  Copyright © 2017年 HomerIce. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController {

    var todoItems: [TodoItem] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var clearTodoBtn: UIButton!
    @IBOutlet weak var addTodo: UIButton!

    required init?(coder aDecoder: NSCoder) {
        todoItems = [TodoItem]()

        super.init(coder: aDecoder)
        loadTodoItems()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addTodoItem(_ sender: Any) {
        let newRowIndex = todoItems.count
        
        let todoItem = TodoItem(name: "Todo Demo", isFinished: false)
        todoItems.append(todoItem)

        let indexPath = IndexPath(item: newRowIndex, section: 0)

        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    @IBAction func saveTodoList(_ sender: Any) {
        saveTodoItems()
    }

    @IBAction func clearTodoList(_ sender: Any) {
        todoItems = [TodoItem]()

        tableView.reloadData()
    }

}
