//
//  Alert.swift
//  BoostSDK
//
//  Created by Ondrej Rafaj on 01/06/2018.
//

import Foundation
import UIKit


open class Alert {
    
    public static func show(title: String, message: String, dismiss: String? = Lang.get("general.ok"), confirm: (title: String, action: (() -> Void))? = nil, on controller: UIViewController? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let dismiss = dismiss {
            alert.addAction(UIAlertAction(title: dismiss, style: .cancel, handler: { action in
                alert.dismiss(animated: true)
            }))
        }
        if let confirm = confirm {
            alert.addAction(UIAlertAction(title: confirm.title, style: .default, handler: { action in
                confirm.action()
                alert.dismiss(animated: true)
            }))
        }
        
        guard let controller = controller ?? UIApplication.shared.delegate?.window??.rootViewController else {
            return
        }
        controller.present(alert, animated: true)
    }
    
}
