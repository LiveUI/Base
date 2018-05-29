//
//  Debuggable.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation


/// Errors that can have visual representation
public protocol Debuggable: Swift.Error {
    var image: UIImage? { get }
    var title: String { get }
    var reason: String { get }
}


extension Debuggable {
    
    /// Default implementation for reason
    var reason: String {
        return localizedDescription
    }
    
}
