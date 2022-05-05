//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 01/03/2022.
//

import UIKit

class ViewController: UIViewController {
    let employeeM = EmployeeManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        employeesCreation()
        //employeeM.deleteAll()
//        employeeM.deleteEmployee(id: UUID(uuidString: "")!)
        getAllEmployees()
    }
    
    func employeesCreation(){
        let accOne = Account(id: UUID(), salary: Int16(750))
        let accTwo = Account(id: UUID(), salary: 150)
        let accThree = Account(id: UUID(), salary: 255)
        
        
        let empOne = Employee(email: "abc@gmail.com", id: UUID(), name: "Zafar", profilePic: (UIImage(named: "empOne")?.pngData()!)!, account: accOne)
        let empTwo = Employee(email: "xyz@gmail.com", id: UUID(),name: "Safar", profilePic: nil,  account: accTwo)
        let empThree = Employee(email: "Bnm@gmail.com", id: UUID(), name: "Hashar", profilePic: nil,  account: accThree)
        employeeM.createEmployee(employee: empOne)
        employeeM.createEmployee(employee: empTwo)
        employeeM.createEmployee(employee: empThree)
    }
    func getAllEmployees(){
        let allEmployees = employeeM.getAll()
        allEmployees?.forEach({ employee in
            print("Name : \(employee.name) Email : \(employee.email) UUID : \(employee.id)")
        })
    }
}

