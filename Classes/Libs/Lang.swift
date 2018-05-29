//
//  Lang.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation


/// Basic language helper
final public class Lang {
    
    /// Translation for a key with a default value
    public static func get(_ key: String, default: String? = nil) -> String {
        return key
    }
    
    /// Translation for a key with a default key-value
    public static func get(_ key: String, defaultKey: String) -> String {
        return get(key, default: get(defaultKey))
    }
    
}
