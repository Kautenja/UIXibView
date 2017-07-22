//
//  XibView.swift
//  XibView
//
//  Created by James Kauten on 7/9/17.
//

import UIKit

/// A class for loading a view from a xib file
open class UIXibView: UIView {
    
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
    
    /// the custom xib file name if one is applied
    open var xibName: String? {
        return nil
    }
    
    /// the root view from the xib file
    public var view: UIView!
    
    /// Return the view loaded from the xib file this class owns
    internal var viewFromXib: UIView? {
        // assume the xib is named the same as the class
        let xibName = self.xibName ?? String(describing: classForCoder)
        // get the bundle, dynamic to work with runtime or IBBuilder
        let bundle = Bundle(for: type(of: self))
        // load the nib
        return bundle.loadNibNamed(xibName, owner: self,
                                   options: nil)?.first as? UIView
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
    
    /// the tag for the view
    @IBInspectable open override var tag: Int {
        get {
            return view.tag
        }
        set {
            guard let _view = view else {
                super.tag = newValue
                return
            }
            _view.tag = newValue
        }
    }
    
    /// determines whether user interaction is enabled or not
    @IBInspectable open override var isUserInteractionEnabled: Bool {
        get {
            return view.isUserInteractionEnabled
        }
        set {
            guard let _view = view else {
                super.isUserInteractionEnabled = newValue
                return
            }
            _view.isUserInteractionEnabled = newValue
        }
    }
    
    /// whether the view should allow multitouch or not
    @IBInspectable open override var isMultipleTouchEnabled: Bool {
        get {
            return view.isMultipleTouchEnabled
        }
        set {
            guard let _view = view else {
                super.isMultipleTouchEnabled = newValue
                return
            }
            _view.isMultipleTouchEnabled = newValue
        }
    }

    /// the alpha value for the view
    @IBInspectable open override var alpha: CGFloat {
        get {
            return view.alpha
        }
        set {
            guard let _view = view else {
                super.alpha = newValue
                return
            }
            _view.alpha = newValue
        }
    }
    
    /// the background color of the view
    @IBInspectable open override var backgroundColor: UIColor? {
        get {
            return view.backgroundColor
        }
        set {
            guard let _view = view else {
                super.backgroundColor = newValue
                return
            }
            _view.backgroundColor = newValue
        }
    }

    /// the tint color of the view
    @IBInspectable open override var tintColor: UIColor? {
        get {
            return view.tintColor
        }
        set {
            guard let _view = view else {
                super.tintColor = newValue
                return
            }
            _view.tintColor = newValue
        }
    }
    
    /// the accessibilit identifier for the view
    @IBInspectable open override var accessibilityIdentifier: String? {
        get {
            return view.accessibilityIdentifier
        }
        set {
            guard let _view = view else {
                super.accessibilityIdentifier = newValue
                return
            }
            _view.accessibilityIdentifier = newValue
        }
    }
    
    /// determines whether to draw the view or leave ie invisible
    @IBInspectable open override var isHidden: Bool {
        get {
            return view.isHidden
        }
        set {
            guard let _view = view else {
                super.isHidden = newValue
                return
            }
            _view.isHidden = newValue
        }
    }
    
    /// determines whether the context is cleared before drawing
    @IBInspectable open override var clearsContextBeforeDrawing: Bool {
        get {
            return view.clearsContextBeforeDrawing
        }
        set {
            guard let _view = view else {
                super.clearsContextBeforeDrawing = newValue
                return
            }
            _view.clearsContextBeforeDrawing = newValue
        }
    }
    
    /// determines whether suviews will be clipped to the bounds of this view
    @IBInspectable open override var clipsToBounds: Bool {
        get {
            return view.clipsToBounds
        }
        set {
            guard let _view = view else {
                super.clipsToBounds = newValue
                return
            }
            _view.clipsToBounds = newValue
        }
    }
    
    /// determines whether sub views will be autoresized
    @IBInspectable open override var autoresizesSubviews: Bool {
        get {
            return view.autoresizesSubviews
        }
        set {
            guard let _view = view else {
                super.autoresizesSubviews = newValue
                return
            }
            _view.autoresizesSubviews = newValue
        }
    }
    
}
