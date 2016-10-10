//
//  RemumeItemTableViewCell.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 09/10/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import UIKit

class RemumeItemTableViewCell: UITableViewCell {
    @IBOutlet weak var group: UILabel!
    @IBOutlet weak var groupDescription: UILabel!
    @IBOutlet weak var medicationList: UITextView!
    
    func configureCell(item: RemumeItem){
        group.text = item.group
        groupDescription.text = item.groupDescription.description
        medicationList.text = item.medicines.current.joined(separator: "\n")
        medicationList.sizeToFit()
    }
    
}
