//
//  CommonExtensions.swift
//  E-Ticketing
//
//  Created by Muhammad  Naveed on 24/08/2020.
//  Copyright © 2020 technerds. All rights reserved.
//

import Foundation
import UIKit

//MARK:- NsObject
extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
}


//MARK:-  double
extension Double {
    var toString: String{
        return "\(self)"
    }
}

//MARK:-  storyboard
extension UIStoryboard {
    
    enum StoryBoardType: String {
        case  main = "Main"
    }
    class func get(_ name: StoryBoardType) -> UIStoryboard {
        return UIStoryboard(name: name.rawValue, bundle: nil)
    }
}

//MARK:-  bundle
extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}


//MARK:-  view controllers
extension UIViewController {
    func present(buttonTitle: String = "OK", title: String = "Alert", message: String, _ completion: (() -> Void)? = nil)  {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { (action) in
            completion?()
        }))
        
        
//
//        if let rootController = UIApplication.shared.windows.first?.rootViewController {
//             rootController.present(alert, animated: true, completion: nil)
//        return
//        }
       
        self.present(alert, animated: true, completion: nil)
    }
    
     func confirmationAlert(title: String = "Confirmation Alert", _ message: String, _ confirm: (() -> Void)? = nil)  {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        
        alert.addAction(UIAlertAction(title: "CANCEL", style: .default, handler: { (action) in
            print("cancel tapped")
        }))
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            confirm?()
        }))
        
       
//        if let rootController = UIApplication.shared.windows.first?.rootViewController {
//            rootController.present(alert, animated: true, completion: nil)
//            return
//        }
        self.present(alert, animated: true, completion: nil)
        
    }
}

