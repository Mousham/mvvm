//
//  EmployeesViewController.swift
//  MVVMPatter
//
//  Created by Midas on 12/10/2022.
//

import UIKit

class EmployeesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    lazy var viewModel = {
        EmployeesViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initview()
        initviewmodels()
    }
    func initview() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .red
        tableView.separatorColor = .black
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.register(EmployeeCell.nib, forCellReuseIdentifier: EmployeeCell.identifier)
    }
    func initviewmodels() {
        viewModel.getEmployees()
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
}
extension EmployeesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.employeesCellViewModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.identifier, for: indexPath) as? EmployeeCell else { fatalError("nib does not exist") }
        let cellvm = viewModel.getCellViewModel(at: indexPath)
        print(cellvm)
        cell.cellViewModel = cellvm
        return cell
    }
    
    
}
extension EmployeesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
