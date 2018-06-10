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
    
    /// Buttons
    public lazy var buttons = {
        return Buttons()
    }()
    
    /// Separators
    public lazy var separators = {
        return Separators()
    }()
    
}
