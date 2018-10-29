//
//  ErrorViewController.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import Modular
@_exported import UIKit


/// Generic error view controller
open class ErrorViewController: ViewController {
    
    /// Custom buttons closure
    public typealias CustomButtonsClosure = (button: UIButton, action: ((UIButton) -> ()))
    
    /// Custom message
    public struct Message {
        
        /// Image
        public let image: UIImage?
        
        /// Title
        public let title: String
        
        /// Message
        public let message: String
        
        /// Close button title
        public let close: String
        
        /// Initializer
        public init(image: UIImage? = nil, title: String, message: String, close: String = Lang.get("general.close")) {
            self.image = image
            self.title = title
            self.message = message
            self.close = close
        }
        
    }
    
    /// Did close event
    public var didClose: (() -> ())?
    
    /// Custom close action
    public var shouldClose: ((ErrorViewController) -> ())?
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    private let closeButton = UIButton()
    
    public let customButtons: [CustomButtonsClosure]?
    
    // MARK: Initialization
    
    /// Initializer
    public convenience init(_ error: Swift.Error, image: UIImage? = nil, customButtons: CustomButtonsClosure...) {
        let message = Message(image: image, title: Lang.get("general.error"), message: error.localizedDescription)
        self.init(message, customButtons: customButtons)
    }
    
    /// Initializer
    public convenience init(_ error: Debuggable, customButtons: CustomButtonsClosure...) {
        let message = Message(image: error.image, title: error.title, message: error.reason)
        self.init(message, customButtons: customButtons)
    }
    
    /// Initializer
    public convenience init(_ message: Message, customButtons: CustomButtonsClosure...) {
        self.init(message, customButtons: customButtons)
    }
    
    public convenience init(_ error: Swift.Error, image: UIImage? = nil) {
        let message = Message(image: image, title: Lang.get("general.error"), message: error.localizedDescription)
        self.init(message)
    }
    
    /// Initializer
    public convenience init(_ error: Debuggable) {
        let message = Message(image: error.image, title: error.title, message: error.reason)
        self.init(message)
    }
    
    /// Initializer
    public init(_ message: Message, customButtons: [CustomButtonsClosure]?) {
        self.customButtons = customButtons
        
        imageView.image = message.image
        titleLabel.text = message.title
        messageLabel.text = message.message
        
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: Elements
    
    override open func setupElements() {
        super.setupElements()
        
        imageView.contentMode = .scaleAspectFit
        imageView.place.on(view).with.sides().top(80).and.height(70)
        
        titleLabel.textAlignment = .center
        titleLabel.place.below(imageView, top: 50).sides()
        
        messageLabel.textAlignment = .center
        messageLabel.place.below(titleLabel).sides()
        
        closeButton.titleLabel?.textAlignment = .center
        closeButton.place.on(view).sides().match(bottom: view, offset: -20)
    }
    
    // MARK: View lifecycle
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        didClose?()
    }
    
}
