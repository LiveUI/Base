//
//  Presentation.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//

@_exported import Foundation
@_exported import UIKit


/// Style of presentation
public enum Presentation {
    
    /// Push will be attempted, then present modal if unsuccessful
    /// animations are disabled
    case quick
    
    /// Flip screen, modally presented
    case flip
    
    /// Push in UINavigationController
    case push
    
    /// Present as modal view controller
    case present
    
    /// Present as form modal view controller
    /// (iPad only, defaults to present on iPhone)
    case presentForm
    
    /// Present as page modal view controller
    /// (iPad only, defaults to present on iPhone)
    case presentPage
    
}


extension Presentation {
    
    /// Set modal attributes on a view controller
    public func setModalAttributes(on viewController: UIViewController) {
        switch self {
        case .flip:
            viewController.modalTransitionStyle = .flipHorizontal
        case .presentForm:
            viewController.modalPresentationStyle = .formSheet
        case .presentPage:
            viewController.modalPresentationStyle = .pageSheet
        default:
            break
        }
    }
    
    /// Is transition animated?
    public var animated: Bool {
        switch self {
        case .quick:
            return false
        default:
            return true
        }
    }
    
}
