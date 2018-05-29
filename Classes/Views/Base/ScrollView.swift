//
//  View.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//

@_exported import Foundation
@_exported import UIKit


/// Basic ScrollView element
open class ScrollView: UIScrollView {
    
    /// Background view
    private var _backgroundView: BackgroundView? {
        didSet {
            if let bv = _backgroundView {
                bv.place.on(andFill: self)
                sendSubview(toBack: bv)
            }
        }
    }
    
    /// Background view
    public var backgroundView: BackgroundView? {
        set {
            if let bv = newValue {
                _backgroundView = bv
            } else {
                _backgroundView?.removeFromSuperview()
                _backgroundView = nil
            }
        }
        get {
            return _backgroundView
        }
    }
    
    /// Setup all on-view elements
    open func setupElements() {
        
    }
    
    /// Initialization
    public init() {
        super.init(frame: CGRect.zero)
        
        setupElements()
    }
    
    /// Not implemented
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
