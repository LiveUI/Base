//
//  UIViewController+Buttons.swift
//  Base
//
//  Created by Ondrej Rafaj on 03/06/2018.
//

@_exported import Foundation
@_exported import UIKit


public enum Side {
    
    case left
    
    case right
    
}


extension UIViewController {

    open func setBarButton(item title: String, to side: Side = .left, target: Any, action: Selector) {
        let button = UIBarButtonItem(title: title, style: .plain, target: target, action: action)
        switch side {
        case .left:
            navigationItem.leftBarButtonItem = button
        case .right:
            navigationItem.rightBarButtonItem = button
        }
    }
    
    open func setBarButton(imageNamed name: String, to side: Side = .left, target: Any, action: Selector) {
        let button = UIBarButtonItem(image: UIImage(named: name), style: .plain, target: target, action: action)
        switch side {
        case .left:
            navigationItem.leftBarButtonItem = button
        case .right:
            navigationItem.rightBarButtonItem = button
        }
    }

}
