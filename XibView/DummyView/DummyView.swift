//
//  DummyView.swift
//  XibView_Example
//
//  Created by James Kauten on 7/9/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import UIXibView

/// an example of the XibView subclassing pattern
@IBDesignable class DummyView: UIXibView {
    
    /// some segmented control
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    /// some button
    @IBOutlet weak var button: UIButton!
    
    /// the background color of some button, can be changed
    /// in the interface builder
    @IBInspectable var buttonBackgroundColor: UIColor? {
        get {
            return button.backgroundColor
        }
        set {
            button.backgroundColor = newValue
        }
    }
    
    /// the top switch
    @IBOutlet weak var switchTop: UISwitch!
    
    /// the bottom switch
    @IBOutlet weak var switchBottom: UISwitch!
    
}

