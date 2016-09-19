//
//  ViewController.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import UIKit

class InteractionsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = [Plant]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 70
        getPlants(fromService: InteractionsService())
    }

    func getPlants <Service: Gettable> (fromService service: Service) where Service.Data == Plant  {
        service.get {[weak self] result in
            switch result {
            case .success(let plants):
                self?.dataSource = plants
                self?.tableView.reloadData()
                print(self?.dataSource.count)
            case .failure(let message):
                print("failure")
                print(message)
            }
        }
    }

}

extension InteractionsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlantTableViewCell.cellReuseIdentifier, for: indexPath) as! PlantTableViewCell
        cell.configureCell(plant: dataSource[indexPath.row])
        return cell
    }
    
}
