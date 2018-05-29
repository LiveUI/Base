//
//  UILabel+Style.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//

@_exported import Foundation
@_exported import UIKit


extension UILabel {
    
    /// Style label with style!
    public func style(with style: Style) {
        textColor = style.textColor
    }
    
}
