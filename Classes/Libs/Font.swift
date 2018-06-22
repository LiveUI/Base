//
//  Font.swift
//  Base
//
//  Created by Ondrej Rafaj on 04/06/2018.
//

@_exported import Foundation
@_exported import CoreGraphics
@_exported import UIKit


public class Font {
    
    public static func light(size: CGFloat = 12) -> UIFont {
        let font = UIFont(name: "Rubik-Light", size: size)!
        return font
    }
    
    public static func basic(size: CGFloat = 12) -> UIFont {
        let font = UIFont(name: "Rubik-Regular", size: size)!
        return font
    }
    
    public static func bold(size: CGFloat = 12) -> UIFont {
        let font = UIFont(name: "Rubik-Medium", size: size)!
        return font
    }
    
}
