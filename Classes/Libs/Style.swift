//
//  Style.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//

@_exported import UIKit


/// Screen text style
public enum Style {
    
    /// Light (white text)
    case light
    
    /// Dark (dark text)
    case dark
    
    /// Text color based on the style
    public var textColor: UIColor {
        switch self {
        case .dark:
            return .darkText
        case .light:
            return .lightText
        }
    }
    
}
