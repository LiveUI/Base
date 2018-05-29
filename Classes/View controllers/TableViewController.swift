//
//  TableViewController.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 27/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import CoreGraphics
@_exported import UIKit
@_exported import Presentables
@_exported import Modular


/// Basic table view controller setup to be Presentable manager
open class TableViewController: ViewController, PresentableTableViewManageable {
    
    /// Main table view
    public var tableView = UITableView(frame: CGRect.zero, style: .plain)
    
    /// Basic presentable manager
    public let presentableManager = PresentableTableViewDataManager()
    
    /// Presentable data
    public var data: PresentableSections {
        get { return presentableManager.data }
        set { presentableManager.data = newValue }
    }
    
    // MARK: Data
    
    /// Reload data
    open func reloadData() {
        tableView.reloadData()
    }
    
    /// Setup data
    open func setupData() {
        
    }
    
    // MARK: View lifecycle
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.place.on(andFill: view)
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bind()
    }
    
}
