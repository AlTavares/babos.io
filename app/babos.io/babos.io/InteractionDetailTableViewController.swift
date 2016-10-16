
//  InteractionDetailTableViewController.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 09/10/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import UIKit

class InteractionDetailTableViewController: UITableViewController {

    @IBOutlet weak var cardName: CardView!
    @IBOutlet weak var cardScientificName: CardView!
    @IBOutlet weak var cardFamily: CardView!
    @IBOutlet weak var cardParts: CardView!
    @IBOutlet weak var cardPrecautions: CardView!
    @IBOutlet weak var cardInteractions: CardView!
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    
    var plant: Plant! 
    weak var remumeListViewController: RemumeViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 70
        tableView.tableFooterView = UIView()

        var name = plant.name.description
        if let index = name.characters.index(of: "/"){
            name = name.substring(to: index)
        }
        navigationItem.title = name
        cardName.content = plant.name.description
        cardScientificName.content = plant.scientificName.description
        cardFamily.content = plant.family.description
        cardParts.content = plant.parts.description
        cardPrecautions.content = plant.precautions.description
        cardInteractions.content = plant.interactions.description
    }

    override func viewWillDisappear(_ animated: Bool) {
        remumeListViewController.contentSizeDelegate = nil
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let remumeListViewController = segue.destination as? RemumeViewController {
            self.remumeListViewController = remumeListViewController
            remumeListViewController.contentSizeDelegate = self
            remumeListViewController.filterableDataSource.filtered = true
            remumeListViewController.filterableDataSource.filter = { [unowned self] remumeItem in
                if let interactions = self.plant.interactionGroups {
                    return interactions.contains(remumeItem.group)
                }
                return false
            }
        }
    }

}

extension InteractionDetailTableViewController: ContentSizeDelegate {
    
    func contentSizeDidChange(size: CGSize) {
        remumeListViewController.tableView.isScrollEnabled = false
        remumeListViewController.tableView.bounces = false
        containerHeight.constant = size.height == 0 ? 0 : size.height + 10
    }

}
