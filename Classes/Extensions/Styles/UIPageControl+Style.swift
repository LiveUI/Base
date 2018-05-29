//
//  UIPageControl.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//

@_exported import Foundation
@_exported import UIKit


extension UIPageControl {
    
    /// Style page control with style!
    public func style(with style: Style) {
        switch style {
        case .light:
            backgroundColor = UIColor.black.withAlphaComponent(0.1)
            currentPageIndicatorTintColor = .white
            pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.4)
        case .dark:
            backgroundColor = UIColor.white.withAlphaComponent(0.1)
            currentPageIndicatorTintColor = .black
            pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.3)
        }
    }
    
}
