//
//  CollectionReusableView.swift
//  Base
//
//  Created by Ondrej Rafaj on 29/10/2018.
//

import Foundation
import UIKit


open class CollectionReusableView: UICollectionReusableView {
    
    /// Setup all on-view elements
    open func setupElements() {
        
    }
    
    /// Initialization
    public init() {
        super.init(frame: CGRect.zero)
        
        setupElements()
    }
    
    /// Not implemented
    @available(*, unavailable, message: "Not implemented")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
