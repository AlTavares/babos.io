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
    @IBOutlet var listHeight: NSLayoutConstraint!
    
    
    override func prepareForReuse() {
        listHeight.isActive = true
        group.text = ""
        groupDescription.text = ""
        medicationList.text = ""
    }
    
    func configureCell(item: RemumeItem){
        group.text = " " + item.group
        groupDescription.text = item.groupDescription.description
        if let medicines = item.medicines.current, medicines.count > 0 {
            medicationList.text = "• " + medicines.joined(separator: "\n• ")
            listHeight.isActive = false
        }
    }
    
}
