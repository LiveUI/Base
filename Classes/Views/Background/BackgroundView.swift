//
//  BackgroundView.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//

@_exported import Foundation
@_exported import UIKit
@_exported import Modular


/// Universal background view
open class BackgroundView: View {
    
    /// Background image view
    public internal(set) var imageView: UIImageView?
    
    /// Background image
    public var image: UIImage? {
        get {
            return imageView?.image
        }
        set {
            if newValue == nil {
                imageView?.removeFromSuperview()
                imageView = nil
            }
            if let iv = imageView {
                iv.image = newValue
            } else if let image = newValue {
                let iv = UIImageView(image: image)
                iv.contentMode = contentMode
                iv.place.on(andFill: self)
            }
        }
    }
    
    /// Gradient view
    public internal(set) var gradientView: GradientView?
    
    /// Gradient view config
    public var gradient: GradientView.Config? {
        get {
            return gradientView?.configuration
        }
        set {
            if let config = newValue {
                if let gv = gradientView {
                    gv.configuration = config
                } else {
                    let gv = GradientView(config)
                    gv.place.on(andFill: self)
                }
            } else {
                gradientView?.removeFromSuperview()
                gradientView = nil
            }
        }
    }
    
    /// Background content mode
    open override var contentMode: UIViewContentMode {
        didSet {
            imageView?.contentMode = contentMode
        }
    }
    
    // MARK: Initialization
    
    /// Initializer
    public override init() {
        super.init()
    }
    
    /// Image initializer
    public init(_ image: UIImage) {
        imageView = UIImageView(image: image)
        super.init()
        imageView?.place.on(andFill: self)
    }
    
    /// Gradient initializer
    public init(_ config: GradientView.Config) {
        gradientView = GradientView(config)
        super.init()
        gradientView?.place.on(andFill: self)
    }
    
    // MARK: Elements
    
    open override func setupElements() {
        super.setupElements()
        
        contentMode = .scaleAspectFit
    }
    
}
