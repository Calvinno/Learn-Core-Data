//
//  ViewController.swift
//  Learning Core Data
//
//  Created by Calvin Cantin1 on 2019-04-09.
//  Copyright © 2019 Calvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let persistenceManager: PersistenceManager
    var users:[User] = [User]()
    
    init(persistenceManager: PersistenceManager) {
        self.persistenceManager  = persistenceManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
 
    }
    
    func printUser()
    {
        users.forEach({ print($0.name) })
    }
    // create Core Data Object
    func createUser()
    {
        let user = User(context: persistenceManager.context)
        user.name = "Andrew"
        
        persistenceManager.save()
    }
    
    func getUser()
    {
        let users = persistenceManager.fetch(User.self)
        self.users = users
        printUser()
        
        let deadLine = DispatchTime.now() + .seconds(5)
//        DispatchQueue.main.asyncAfter(deadline: deadLine, execute: deleteUser)
    }

    func updateUsers()
    {
        let firstUser = users.first!
        firstUser.name += " - YO YOU UPDATED BRO!"
        persistenceManager.save()
        printUser()
    }
    
    func deleteUser()
    {
        let firstUser = users.first!
        
        persistenceManager.delete(firstUser)
        
        printUser()
    }
}

