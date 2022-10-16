//
//  EmployeeViewModel.swift
//  MVVMPatter
//
//  Created by Midas on 13/10/2022.
//

import Foundation

class EmployeesViewModel: NSObject {
    private var employeeService: EmployeeServiceProtocol
    var reloadTableView: (() -> Void)?
    var employees = Employees()
    var employeesCellViewModels = [EmployeeCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    init(employeeService: EmployeeServiceProtocol = EmployeeServise()) {
        self.employeeService = employeeService
        
    }
    func getEmployees() {
        self.employeeService.getEmployees() {success,results,error in
            if success, let employees = results {
                self.fetchData(employees: employees)
            } else {
                
            }
        }
    }
    func fetchData(employees: Employees) {
        self.employees = employees// cache
        var vms = [EmployeeCellViewModel]()
        for employee in employees {
            vms.append(createCellModel(employee: employee))
        }
    }
    func createCellModel(employee: Employee) -> EmployeeCellViewModel {
        let id = employee.id
        let name = employee.employeeName
        let salary = employee.employeeSalary
        let age = employee.employeeAge
        return EmployeeCellViewModel(id: id, name: name, salary: salary, age: age)
    }
    
    func getCellViewModel(at indexpath: IndexPath) -> EmployeeCellViewModel {
        print(employeesCellViewModels)
        return employeesCellViewModels[indexpath.row]
    }
   
}
