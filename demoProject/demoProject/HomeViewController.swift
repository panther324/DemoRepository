//
//  HomeViewController.swift
//  demoProject
//
//  Created by Pankaj on 20/03/24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var usernameTableView: UITableView!

    let usernameArray = ["Pankaj", "Aditya", "Shashi", "Yash", "Nilesh", "Abhishek", "Ajay", "Sachin", "Rohit", "Virat"]

    // MARK: - View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
    }


}

// MARK: - Private Methods
extension HomeViewController {
    private func setupTableView() {
        usernameTableView.dataSource = self
        usernameTableView.register(UINib(nibName: String(describing: UsernameTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: UsernameTableViewCell.self))
    }

    private func showAlert(title: String, subTitle: String) {
        let alertController = UIAlertController(title: title, message: subTitle, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - TableView Delegate
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usernameArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UsernameTableViewCell.self), for: indexPath) as? UsernameTableViewCell {
            cell.configureCell(username: usernameArray[indexPath.row])
            cell.delegate = self
            cell.indexPath = indexPath
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - Custom delegate -
extension HomeViewController: CellButtonDelegate {
    func cellButtonTapped(indexPath: IndexPath) {
        showAlert(title: "Demo Project!", subTitle: usernameArray[indexPath.row])
    }
}
