//
//  InlineButton.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 01/06/2018.
//

@_exported import Foundation
@_exported import UIKit


/// Default inline button theme
public struct InlineButtonTheme: ButtonTheme {
    
    public var cornerRadius: CGFloat?
    
    public var border: (color: UIColor, width: CGFloat)?
    
    public var fill: UIColor?
    
    public var font: UIFont = UIFont.systemFont(ofSize: 15)
    
    public var textColor: UIColor = .white
    
}


/// Inline button
open class InlineButton: Button {
    
    open override var theme: ButtonTheme {
        return Theme.default.inlineButton ?? InlineButtonTheme()
    }
    
}
