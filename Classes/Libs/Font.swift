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
    
    public static func basic(size: CGFloat = 12) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }
    
    public static func basicBold(size: CGFloat = 12) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size)
    }
    
}
