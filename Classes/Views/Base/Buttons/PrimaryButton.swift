//
//  PrimaryButton.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 01/06/2018.
//

@_exported import Foundation
@_exported import UIKit


/// Default primary button theme
public struct PrimaryButtonTheme: ButtonTheme {
    
    public var cornerRadius: CGFloat? = 4
    
    public var border: (color: UIColor, width: CGFloat)? = {
        return (
            color: UIColor(hex: "EEEEEE").withAlphaComponent(0.5),
            width: 2.0
        )
    }()
    
    public var fill: UIColor? = UIColor(hex: "EEEEEE")
    
    public var font: UIFont = UIFont.boldSystemFont(ofSize: 13)
    
    public var textColor: UIColor = UIColor(hex: "DE4DCB")
    
}


/// Secondary button
open class PrimaryButton: Button {
    
    open override var theme: ButtonTheme {
        return Theme.default.primaryButton ?? PrimaryButtonTheme()
    }
    
}
