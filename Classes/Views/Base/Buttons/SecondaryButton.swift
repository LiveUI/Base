//
//  SecondaryButton.swift
//  Boost
//
//  Created by Ondrej Rafaj on 01/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


/// Default secondary button theme
public struct SecondaryButtonTheme: ButtonTheme {
    
    public var cornerRadius: CGFloat? = 4
    
    public var border: (color: UIColor, width: CGFloat)? = {
        return (
            color: UIColor(hex: "EEEEEE").withAlphaComponent(0.5),
            width: 2.0
        )
    }()
    
    public var fill: UIColor?
    
    public var font: UIFont = Font.bold(size: 13)
    
    public var textColor: UIColor = UIColor(hex: "EEEEEE")
    
}


/// Secondary button
open class SecondaryButton: Button {
    
    open override var theme: ButtonTheme {
        return Theme.default.buttons.secondaryButton
    }
    
}
