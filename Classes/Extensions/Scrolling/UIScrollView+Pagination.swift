//
//  UIScrollView+Pagination.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//

@_exported import Foundation
@_exported import UIKit


extension UIScrollView {
    
    /// Go to page number (horizontal scrolling)
    public func goto(page: Int, animated: Bool = true) {
        let x = (frame.size.width * CGFloat(page))
        setContentOffset(CGPoint(x: x, y: 0), animated: animated)
    }
    
}
