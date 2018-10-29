//
//  OnboardingView.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//

@_exported import Foundation
@_exported import UIKit


/// Single onboarding view
open class OnboardingView: View {
    
    /// Single screen configuration
    public struct Config {
        
        /// Image
        let image: UIImage?
        
        /// Title
        public let title: String
        
        /// Message
        public let message: String
        
        /// Content style
        public let style: Style
        
        /// Action
        public let action: Button.Tuple?
        
        /// Skip step action
        public let skip: Button.Tuple?
        
        /// Initializer
        public init(image: UIImage? = nil, title: String, message: String, style: Style = .dark, action: Button.Tuple? = nil, skip: Button.Tuple? = nil) {
            self.image = image
            self.title = title
            self.message = message
            self.style = style
            self.action = action
            self.skip = skip
        }
        
    }
    
    /// Image view
    public let imageView = UIImageView()
    
    /// Main title label
    public let titleLabel = Label(fontStyle: .headline)
    
    /// Main message label
    public let messageLabel = Label(fontStyle: .subheadline)
    
    /// Action button
    public let actionButton: Button?
    
    /// Skip button
    public let skipButton: Button?
    
    // MARK: Initialization
    
    /// Initializer
    public init(image: UIImage? = nil, title: String, message: String, style: Style = .dark, action: Button.Tuple?, skip: Button.Tuple?) {
        if let action = action {
            actionButton = PrimaryButton(action)
        } else { actionButton = nil }
        if let skip = skip {
            skipButton = SecondaryButton(skip)
        } else { skipButton = nil }
        
        super.init()
        
        // Image view & title
        if let image = image?.withRenderingMode(.alwaysTemplate) {
            imageView.tintColor = style == .light ? .white : .darkText
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            imageView.place.on(self).centerX().centerY(offset: -150).square(side: 120)
            
            titleLabel.place.below(imageView).sides()
        } else {
            titleLabel.place.on(self).sides().centerY(offset: -130)
        }
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.style(with: style)
        
        // Message
        messageLabel.place.below(titleLabel).sides()
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.style(with: style)
        
        // Skip button
        if let button = skipButton {
            addSubview(button)
            button.snp.makeConstraints { (make) in
                make.bottom.equalToSuperview().offset(-90)
            }
            button.make.sides().height(44)
        }
        
        // Action button
        if let button = actionButton {
            if let skipButton = skipButton {
                _ = button.place.above(skipButton, bottom: -20)
            } else {
                addSubview(button)
                button.snp.makeConstraints { (make) in
                    make.bottom.equalToSuperview().offset(-90)
                }
            }
            button.make.sides().height(44)
        }
    }
    
    /// Initializer
    public convenience init(_ config: Config) {
        self.init(image: config.image, title: config.title, message: config.message, style: config.style, action: config.action, skip: config.skip)
    }
    
    // MARK: Elements
    
    open override func setupElements() {
        super.setupElements()
        
        
    }
    
}
