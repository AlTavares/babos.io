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
    @IBOutlet weak var txtContent: UITextView!
    @IBInspectable var content: String! {
        didSet{
            txtContent.text = content
            
        }
    }
    @IBOutlet weak var contentView: UIView!
    @IBInspectable var contentViewColor: UIColor! {
        didSet {
            contentView.backgroundColor = contentViewColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 4
    
    override func layoutSubviews() {
        backgroundColor = UIColor.clear
//        layer.cornerRadius = 10
//        layer.masksToBounds = true
//        clipsToBounds = true
//        layer.borderWidth = 0.5
//        layer.borderColor = UIColor.white.cgColor //UIColor.black.withAlphaComponent(0.15).cgColor
        
    }
    
    
}
