//
//  MainViewController.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 01/01/24.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perbandingan"
        setupTableView()
        configureData()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(TabTableViewCell.self)
        tableView.registerNib(ChartTableViewCell.self)
        tableView.registerNib(TimeTableViewCell.self)
        tableView.registerNib(ComparationTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
    }

    func configureData() {
        viewModel.bindCompareChartDataToController = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel.bindCompareProductsDataToController = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(TabTableViewCell.self, for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(ChartTableViewCell.self, for: indexPath)
            cell.setupChartView(lineChartData: viewModel.lineChartData)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(TimeTableViewCell.self, for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(ComparationTableViewCell.self, for: indexPath)
            cell.delegate = self
            cell.compareProductData = viewModel.compareProductData
            cell.setupDataToView()
            return cell
        }
    }
}

extension MainViewController: UITableViewDelegate, CompareDelegate {
    func didAlertAction(message: String) {
        alertWith(message: message)
    }

    func alertWith(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let btnOk = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(btnOk)
        present(alert, animated: true, completion: nil)
    }
}
