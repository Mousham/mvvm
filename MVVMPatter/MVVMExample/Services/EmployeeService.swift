//
//  EmployeeService.swift
//  MVVMPatter
//
//  Created by Midas on 12/10/2022.
//

import Foundation
protocol EmployeeServiceProtocol {
    func getEmployees(completion: @escaping (_ success: Bool, _ results: Employees?, _ error: String?) -> ())
}

class EmployeeServise: EmployeeServiceProtocol {
    func getEmployees(completion: @escaping (Bool, Employees?, String?) -> ()) {
        HttpRequestHelper().GET(url: "https://raw.githubusercontent.com/johncodeos-blog/MVVMiOSExample/demo.json", params: ["":""], httpHeader: .application_json) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(Employees.self
                                                         , from: data!)
                    completion(true,model,"Success")
                } catch {
                    completion(false, nil, "Error: Trying to parse Employees to model")
                }
            } else {
                completion(false,nil,"Error getting data")
            }
        }
    }
}
