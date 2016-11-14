//
//  PlantTableViewCell.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/18/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import UIKit

class PlantTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var scientificName: UILabel!
    @IBOutlet weak var plantImage: UIImageView!

    override func prepareForReuse() {
        name.text = ""
        scientificName.text = ""
        plantImage.image = #imageLiteral(resourceName: "babosa")
    }
    
    func configureCell(plant: Plant){
        name.text = plant.name.description
        scientificName.text = plant.scientificName.description
    }


}
