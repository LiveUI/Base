//
//  Button.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//

@_exported import Foundation
@_exported import UIKit


/// Button theme
public protocol ButtonTheme {
    
    /// Corner radius
    var cornerRadius: CGFloat? { get }
    
    /// Border
    var border: (color: UIColor, width: CGFloat)? { get }
    
    /// Fill color
    var fill: UIColor? { get }
    
    /// Font
    var font: UIFont { get }
    
    /// Text color
    var textColor: UIColor { get }
    
}

public struct BasicButtonTheme: ButtonTheme {
    
    public var cornerRadius: CGFloat? = 3
    
    public var border: (color: UIColor, width: CGFloat)? = {
        return (color: .white, width: 1)
    }()
    
    public var fill: UIColor?
    
    public var font: UIFont = Font.bold(size: 13)
    
    public var textColor: UIColor = .white
    
}

public protocol Themable {
    
    /// Type of the theme
    associatedtype ThemeType
    
    /// Theme
    var theme: ThemeType { get }
    
}

/// Basic button element
open class Button: UIButton, Themable {
    
    public typealias ThemeType = ButtonTheme
    
    public typealias Tuple = (title: String, action: ActionClosure)
    
    /// Action closure
    public typealias ActionClosure = ((Button) -> ())
    
    /// Main action
    public var action: ActionClosure?
    
    /// Add target has been disabled; Please use `action` instead
    open override func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        fatalError("Please use `action` instead")
    }
    
    // MARK: Theming
    
    open var theme: ButtonTheme {
        return BasicButtonTheme()
    }
    
    /// Load a theme
    open func load(_ theme: ButtonTheme?) {
        let theme = theme ?? self.theme
        layer.cornerRadius = theme.cornerRadius ?? 0.0
        if let border = theme.border {
            layer.borderColor = border.color.cgColor
            layer.borderWidth = border.width
        }
        titleLabel?.font = theme.font
        setTitleColor(theme.textColor, for: .normal)
        backgroundColor = theme.fill
    }
    
    // MARK: Initialization
    
    /// Setup
    open func setup() {
        
    }
    
    /// Initializer
    public init(image: UIImage? = nil, title: String, theme: ButtonTheme? = nil, action: ActionClosure? = nil) {
        super.init(frame: CGRect.zero)
        
        if let image = image {
            setImage(image, for: .normal)
        }
        
        setTitle(title, for: .normal)
        titleLabel?.adjustsFontForContentSizeCategory = true
        
        self.action = action
        
        super.addTarget(self, action: #selector(didTap(_:)), for: .touchUpInside)
        
        setup()
        load(theme)
    }
    
    /// Initializer
    public convenience init(_ info: Tuple, image: UIImage? = nil, theme: ButtonTheme? = nil) {
        self.init(image: image, title: info.title, theme: theme, action: info.action)
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
