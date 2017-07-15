//
//  XibView.swift
//  XibView
//
//  Created by James Kauten on 7/9/17.
//

import UIKit

/// A class for loading a view from a xib file
open class XibView: UIView {
    
    /// the root view from the xib file
    public var view: UIView!
    
    /// Return the view loaded from the xib file this class owns
    internal var viewFromXib: UIView? {
        // assume the xib is named the same as the class
        let xibName = String(describing: classForCoder)
        // get the bundle, dynamic to work with runtime or IBBuilder
        let bundle = Bundle(for: type(of: self))
        // load the nib
        return bundle.loadNibNamed(xibName, owner: self,
                                   options: nil)?.first as? UIView
    }
    
    /// Initialize a new XibView with the given frame
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    /// Initialize a new XibView with the given coder
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    /// Load the custom view from its xib file and set it up.
    internal func setupView() {
        // try to load the xib file
        guard let _view = viewFromXib else {
            NSLog("\(classForCoder): failed to load view from xib")
            return
        }
        view = _view
        // set the frame to autoresize
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // add the sub view
        addSubview(view)
    }
    
}
