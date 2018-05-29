//
//  Button.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//

@_exported import Foundation
@_exported import UIKit


/// Basic button element
open class Button: UIButton {
    
    public typealias Tuple = (title: String, action: ActionClosure)
    
    /// Action closure
    public typealias ActionClosure = ((Button) -> ())
    
    /// Main action
    public var action: ActionClosure?
    
    /// Add target has been disabled; Please use `action` instead
    open override func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        fatalError("Please use `action` instead")
    }
    
    // MARK: Initialization
    
    /// Initializer
    public init(image: UIImage? = nil, title: String, action: ActionClosure? = nil) {
        super.init(frame: CGRect.zero)
        
        if let image = image {
            setImage(image, for: .normal)
        }
        
        setTitle(title, for: .normal)
        titleLabel?.adjustsFontForContentSizeCategory = true
        
        super.addTarget(self, action: #selector(didTap(_:)), for: .touchUpInside)
    }
    
    /// Initializer
    public convenience init(_ info: Tuple, image: UIImage? = nil) {
        self.init(image: image, title: info.title, action: info.action)
    }
    
    /// Not implemented
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Action
    
    /// Target action
    @objc func didTap(_ sender: Button) {
        action?(sender)
    }
    
}


extension Optional where Wrapped == Button.Tuple {
    
    /// Creates a new button or returns nil if tuple is nil
    public func button() -> Button? {
        if let action = self {
            return Button(action)
        } else {
            return nil
        }
    }
    
}
