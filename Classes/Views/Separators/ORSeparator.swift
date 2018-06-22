//
//  ORSeparator.swift
//  Base
//
//  Created by Ondrej Rafaj on 04/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Modular


public protocol ORSeparatorTheme {
    
    /// Color of the side lines
    var lineColor: UIColor { get }
    
    /// Color of the centre text
    var textColor: UIColor { get }
    
    /// Text font
    var font: UIFont { get }
    
    /// Spacing between copy and text
    var spacing: CGFloat { get }
    
    /// Line height
    var lineHeight: CGFloat { get }
    
}

public struct ORSeparatorBasicTheme: ORSeparatorTheme {
    
    public var lineColor: UIColor = UIColor(white: 1, alpha: 0.8)
    
    public var textColor: UIColor = .white
    
    public var font: UIFont = Font.bold(size: 14)
    
    public var spacing: CGFloat = 12
    
    public var lineHeight: CGFloat = 5
    
    public init() { }
    
}

open class ORSeparator: View, Themable {
    
    open var theme: ORSeparatorTheme
    
    let textLabel = UILabel()
    let leftLine = UIView()
    let rightLine = UIView()
    
    // MARK: Elements
    
    override open func setupElements() {
        super.setupElements()
        
        textLabel.text = Lang.get("general.or")
        textLabel.font = theme.font
        textLabel.place.on(self).centerX().topToBottom()
        
        leftLine.backgroundColor = theme.lineColor
        leftLine.place.before(textLabel, height: theme.lineHeight, left: 0, right: theme.spacing).centerY()
        
        rightLine.backgroundColor = leftLine.backgroundColor
        rightLine.place.next(to: textLabel, height: theme.lineHeight, left: theme.spacing, right: 0).centerY()
    }
    
    // MARK: Initialization
    
    /// Initializer
    public init(_ theme: ORSeparatorTheme? = nil) {
        self.theme = theme ?? Theme.default.separators.or
        
        super.init()
    }
    
    @available(*, unavailable, message: "This method is unavailable")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
