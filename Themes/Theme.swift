//
//  Theme.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 01/06/2018.
//

@_exported import Foundation
@_exported import UIKit


/// Main theme
open class Theme {
    
    /// Singleton access property
    public static let `default` = Theme()
    
    /// Primary button theme
    public var primaryButton: ButtonTheme?
    
    /// Secondary button theme
    public var secondaryButton: ButtonTheme?
    
    /// Inline button theme
    public var inlineButton: ButtonTheme?
    
}
