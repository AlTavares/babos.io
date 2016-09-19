//
//  TableViewCellExtension.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/18/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class var cellReuseIdentifier: String {
        return String(describing: self)
    }
}
