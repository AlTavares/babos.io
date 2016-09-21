//
//  CardView.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/20/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import UIKit
import NibDesignable

@IBDesignable
class CardView: NibDesignable {
    @IBOutlet weak var lblTitle: UILabel!
    @IBInspectable var title: String! {
        didSet{
            lblTitle.text = title
        }
    }
    @IBOutlet weak var lblContent: UILabel!
    @IBInspectable var content: String! {
        didSet{
            lblContent.text = content
        }
    }
    @IBOutlet weak var contentView: UIView!
    @IBInspectable var contentViewColor: UIColor! {
        didSet {
            contentView.backgroundColor = contentViewColor
        }
    }
    @IBOutlet weak var titleView: UIView!
    @IBInspectable var titleViewColor: UIColor = UIColor.white {
        didSet {
            contentView.backgroundColor = contentViewColor
        }
    }
    
    override func prepareForInterfaceBuilder() {
        
    }
    
    
}
