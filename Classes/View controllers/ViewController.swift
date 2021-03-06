//
//  ViewController.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 27/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import UIKit


/// Basic view controller to be used by all subclasses
open class ViewController: UIViewController {
    
    /// Background view
    private var _backgroundView: BackgroundView? {
        didSet {
            if let bv = _backgroundView {
                bv.place.on(andFill: view)
                view.sendSubview(toBack: bv)
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
    
    /// Setup all on-screen elements
    open func setupElements() {
        
    }
    
    // MARK: Initialization
    
    /// Main initializer
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    /// Main initializer
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    /// Not implemented
    @available(*, unavailable, message: "Not implemented")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View lifecycle
    
    /// LiveUI view replacement
    public var betterView: View? {
        return view as? View
    }
    
    open override func loadView() {
        view = View()
        view.backgroundColor = .white
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = .white
        
        setupElements()
    }

}


extension ViewController {
    
    func setupMenuIcon() {
        
    }
    
}

