//
//  Label.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//

@_exported import Foundation
@_exported import UIKit


/// Basic Label element
open class Label: UILabel {
    
    /// Initializer
    public init(fontStyle: UIFontTextStyle) {
        super.init(frame: CGRect.zero)
        
        font = UIFont.preferredFont(forTextStyle: fontStyle)
        adjustsFontForContentSizeCategory = true
    }
    
    /// Not implemented
    @available(*, unavailable, message: "Not implemented")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
