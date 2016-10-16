//
//  ViewController.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import UIKit

protocol ContentSizeDelegate {
    func contentSizeDidChange(size: CGSize)
}

class RemumeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var contentSizeDelegate: ContentSizeDelegate?
    var filterableDataSource = FilterableDataSource<RemumeItem>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
        getRemumeList()
    }
    
    func getRemumeList()  {
        RemumeService().get {[weak self] result in
            switch result {
            case .success(let list):
                self?.filterableDataSource.dataSource = list
                self?.reloadTableView()
            case .failure(let message):
                print("failure")
                print(message)
            }
        }
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
        self.tableView.layoutIfNeeded()
        self.contentSizeDelegate?.contentSizeDidChange(size: self.tableView.contentSize)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        let vc = segue.destination as! InteractionDetailTableViewController
        //        vc.remumeItem = sender as! RemumeItem
    }
    
}

extension RemumeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterableDataSource.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RemumeItemTableViewCell.cellReuseIdentifier, for: indexPath) as! RemumeItemTableViewCell
        cell.configureCell(item: filterableDataSource.dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        performSegue(withIdentifier: "showInteractionDetail", sender: dataSource[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

