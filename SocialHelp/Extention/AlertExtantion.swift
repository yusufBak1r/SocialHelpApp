//
//  AlertExtantion.swift
//  SocialHelp
//
//  Created by yusuf bakır on 8.11.2023.
//

import Foundation
import UIKit
extension UIViewController{
    func addAlert(title: String, message: String) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okeyAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okeyAction)
        return alert
    }
    
    
    
    
    
    func setBackgroundImage(imageName: String) {
            let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: imageName)
            backgroundImage.contentMode = .scaleAspectFill
            view.insertSubview(backgroundImage, at: 0)
        }
    
    
}

