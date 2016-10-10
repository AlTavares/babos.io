//
//  ViewController.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import UIKit

class RemumeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = [RemumeItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        getRemumeList()
    }

    func getRemumeList()  {
        RemumeService().get {[weak self] result in
            switch result {
            case .success(let list):
                self?.dataSource = list
                self?.tableView.reloadData()
                print(self?.dataSource.count)
                print(list)
            case .failure(let message):
                print("failure")
                print(message)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as! InteractionDetailTableViewController
//        vc.remumeItem = sender as! RemumeItem
    }

}

extension RemumeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RemumeItemTableViewCell.cellReuseIdentifier, for: indexPath) as! RemumeItemTableViewCell
        cell.configureCell(item: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "showInteractionDetail", sender: dataSource[indexPath.row])
    }
    
}
