//
//  Buttons.swift
//  Base
//
//  Created by Ondrej Rafaj on 04/06/2018.
//

import Foundation


open class Buttons {
    
    /// Primary button theme
    public var primaryButton: ButtonTheme = {
        return PrimaryButtonTheme()
    }()
    
    /// Secondary button theme
    public var secondaryButton: ButtonTheme = {
        return SecondaryButtonTheme()
    }()
    
    /// Inline button theme
    public var inlineButton: ButtonTheme = {
        return InlineButtonTheme()
    }()
    
}
