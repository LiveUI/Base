//
//  GradientView.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//

@_exported import Foundation
@_exported import UIKit
@_exported import CoreGraphics


/// Gradient view
public class GradientView: View {
    
    /// Gradient configuration object
    public struct Config {
        
        /// Gradient color object
        public struct Color {
            
            /// Color
            public let color: UIColor
            
            /// Position
            /// (values 0.0 - 1.0 (1 - 100%) of the gradient, top to bottom, left to right, whatever the angle)
            public let position: CGFloat
            
            /// Initialization
            public init(color: UIColor, position: CGFloat) {
                self.color = color
                self.position = (position > 1) ? 1 : position
            }
            
        }
        
        /// Colors
        public let colors: [Color]
        
        /// Gradient angle
        /// Default, 0˚ is top to bottom; -45˚ is top left to bottom right
        public let angle: CGFloat
        
        /// Initializer
        public init(_ colors: [Color], angle: CGFloat = 0) {
            self.colors = colors
            self.angle = angle
        }
        
    }
    
    /// Gradient config
    public var configuration: Config {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: Layout & drawing
    
    override public func draw(_ rect: CGRect) {
        // General Declarations
        guard let context = UIGraphicsGetCurrentContext() else {
            fatalError("Unable to create gradient context")
        }
        
        // Gradient Declarations
        guard let gradient = CGGradient(
            colorsSpace: CGColorSpaceCreateDeviceRGB(),
            colors: configuration.colors.cgColors,
            locations: configuration.colors.locations
        ) else {
            fatalError("Unable to create gradient using given values")
        }
        
        // Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: bounds)
        context.saveGState()
        rectanglePath.addClip()
        context.drawLinearGradient(gradient, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 0, y: bounds.size.height), options: CGGradientDrawingOptions())
        context.restoreGState()
    }
    
    // MARK: Initialization
    
    /// Initializer
    public init(_ config: Config) {
        self.configuration = config
        
        super.init()
    }
    
}


extension Array where Element == GradientView.Config.Color {
    
    /// CGColors
    public var cgColors: CFArray {
        return map({ $0.color.cgColor }) as CFArray
    }
    
    /// Locations
    public var locations: [CGFloat] {
        return map({ $0.position })
    }
    
}
