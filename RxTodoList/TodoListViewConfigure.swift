//
//  TodoListViewConfigure.swift
//  RxTodoList
//
//  Created by HomerIce on 2017/6/18.
//  Copyright © 2017年 HomerIce. All rights reserved.
//

import UIKit

let CELL_CHECKMARK_TAG = 1001
let CELL_TODO_TITLE_TAG = 1002

extension TodoListViewController {
    func configureStatus(for cell: UITableViewCell, with item: TodoItem) {
        let label = cell.viewWithTag(CELL_CHECKMARK_TAG) as! UILabel
        
        if item.isFinished {
            label.text = "✓"
        }
        else {
            label.text = ""
        }
    }
    
    func configureLabel(for cell: UITableViewCell, with item: TodoItem) {
        let label = cell.viewWithTag(CELL_TODO_TITLE_TAG) as! UILabel
        
        label.text = item.name
    }
    
    func documentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return path[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("TodoList.plist")
    }
    
    func saveTodoItems() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        
        archiver.encode(todoItems, forKey: "TodoItems")
        archiver.finishEncoding()
        
        data.write(to: dataFilePath(), atomically: true)
    }
    
    func loadTodoItems() {
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path) {
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            todoItems = unarchiver.decodeObject(forKey: "TodoItems") as! [TodoItem]
            
            unarchiver.finishDecoding()
        }
    }
}
