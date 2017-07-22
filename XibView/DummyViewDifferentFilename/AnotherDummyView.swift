//
//  AnotherDummyView.swift
//  XibView
//
//  Created by James Kauten on 7/22/17.
//  Copyright © 2017 CK Software. All rights reserved.
//

import UIKit
import UIXibView

/// an example of the XibView subclassing pattern
@IBDesignable class AnotherDummyView: UIXibView {
    
    /// The computed xib name variable for loading a xib for this class from a
    /// file that is different from the classes name
    override var xibName: String? {
        return "ArbitraryName"
    }

//    @IBInspectable override var backgroundColor: UIColor? {
//        get {
//            return view.backgroundColor
//        }
//        set {
//            view.backgroundColor = newValue
//        }
//    }
    
    /// the view on the left of the view with the color mark
    @IBOutlet public var colorView: UIView!
    
    /// the color for the view
    @IBInspectable open var color: UIColor? {
        get {
            return colorView.backgroundColor
        }
        set {
            colorView.backgroundColor = newValue
        }
    }
    
    /// the title label on the view
    @IBOutlet weak var titleLabel: UILabel!
    
    /// the title text on the title label
    @IBInspectable var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    /// the detail label on the view
    @IBOutlet weak var subtitleLabel: UILabel!
    
    /// the subtitle text on the subtitle label
    @IBInspectable var subtitle: String? {
        get {
            return subtitleLabel.text
        }
        set {
            subtitleLabel.text = newValue
        }
    }
    
}
