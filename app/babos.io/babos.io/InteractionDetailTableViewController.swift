//
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
    
    var plant: Plant! 

    
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

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
