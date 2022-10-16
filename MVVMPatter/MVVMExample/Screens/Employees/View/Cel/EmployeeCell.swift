//
//  EmployeeCell.swift
//  MVVMPatter
//
//  Created by Midas on 12/10/2022.
//

import UIKit

class EmployeeCell: UITableViewCell {

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    class var identifier: String {
        return String(describing: self)
    }
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    var cellViewModel: EmployeeCellViewModel? {
        didSet {
            self.idLabel.text = cellViewModel?.id
            self.nameLabel.text = cellViewModel?.name
            self.salaryLabel.text = cellViewModel?.salary
            self.ageLabel.text = cellViewModel?.age
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initview()
    }
    func initview() {
        backgroundColor = .clear
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
