//
//  UsernameTableViewCell.swift
//  demoProject
//
//  Created by Pankaj on 20/03/24.
//

import UIKit

protocol CellButtonDelegate: AnyObject {
    func cellButtonTapped(indexPath: IndexPath)
}

class UsernameTableViewCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    var indexPath: IndexPath?
    weak var delegate: CellButtonDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

// MARK: - Configure cell
extension UsernameTableViewCell {
    func configureCell(username: String) {
        userNameLabel.text = username
    }
}

// MARK: - Action Method
extension UsernameTableViewCell {
    @IBAction
    func buttonAction(_ sender: UIButton) {
        if let indexPath = indexPath {
            delegate?.cellButtonTapped(indexPath: indexPath)
        }
    }
}
