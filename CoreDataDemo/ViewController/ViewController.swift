//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 01/03/2022.
//

import UIKit

class ViewController: UIViewController {
    let empOne = Employee(email: "abc@gmail.com", name: "Zafar", profilePic: nil, id: UUID())
    let empTwo = Employee(email: "xyz@gmail.com", name: "Safar", profilePic: nil, id: UUID())
    let empThree = Employee(email: "Bnm@gmail.com", name: "Hashar", profilePic: nil, id: UUID())
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let employeeM = EmployeeManager()
//        employeeM.createEmployee(employee: empOne)
//        employeeM.createEmployee(employee: empTwo)
//        employeeM.createEmployee(employee: empThree)
        let allEmployees = employeeM.getAll()
        allEmployees?.forEach({ employee in
            print("Name : \(String(describing: employee.name)) Email : \(employee.email) UUID : \(employee.id)")
        })
    }

}

