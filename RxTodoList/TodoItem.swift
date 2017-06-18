//
//  TodoItem.swift
//  RxTodoList
//
//  Created by HomerIce on 2017/6/18.
//  Copyright © 2017年 HomerIce. All rights reserved.
//

import Foundation

class TodoItem: NSObject, NSCoding {
    
    var name: String = ""
    var isFinished: Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "Name") as! String
        isFinished = aDecoder.decodeBool(forKey: "isFinished")
        
        super.init()
    }
    
    override init() {
        super.init()
    }
    
    init(name: String, isFinished: Bool) {
        self.name = name
        self.isFinished = isFinished
    }
    
    func toggleFinished() {
        isFinished = !isFinished
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(isFinished, forKey: "isFinished")
    }
}
