//
//  Utilities.swift
//  ChatApp
//
//  Created by Dua Almahyani on 03/02/2021.
//

import Foundation
import UIKit


struct Colors {
    static let blue = UIColor(red: 70.0/255.0, green: 138.0/255.0, blue: 161.0/255.0, alpha: 1)
    static let brightRed = UIColor(red: 222.0/255.0, green: 90.0/255.0, blue: 111.0/255.0, alpha: 1)
    static let lightGreen = UIColor(red: 183/255, green: 215/255, blue: 181/255, alpha: 1)
    static let green = UIColor(red: 43/255, green: 139/255, blue: 111/255, alpha: 1)
}

class Utilities {
    
    func gradentColors(color1: CGColor, color2: CGColor, view: UIView, cornerRadius: CGFloat? = 0) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1,color2]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.size.width, height: view.frame.size.height)
        gradient.cornerRadius = cornerRadius!

        view.layer.insertSublayer(gradient, at: 0)
    }
    
    func blur(view: UIView) {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }
    
    func basicAlert(viewController: UIViewController, with title: String, message: String, action: String, action handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: action, style: .destructive, handler: handler))
        
        viewController.present(alert, animated: true)
    }

}

struct Const {
    /// Image height/width for Large NavBar state
    static let ImageSizeForLargeState: CGFloat = 40
    /// Margin from right anchor of safe area to right anchor of Image
    static let ImageRightMargin: CGFloat = 16
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
    static let ImageBottomMarginForLargeState: CGFloat = 12
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
    static let ImageBottomMarginForSmallState: CGFloat = 6
    /// Image height/width for Small NavBar state
    static let ImageSizeForSmallState: CGFloat = 32
    /// Height of NavBar for Small state. Usually it's just 44
    static let NavBarHeightSmallState: CGFloat = 44
    /// Height of NavBar for Large state. Usually it's just 96.5 but if you have a custom font for the title, please make sure to edit this value since it changes the height for Large state of NavBar
    static let NavBarHeightLargeState: CGFloat = 96.5
}


extension Date {
    
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
    
    func dateFormtted() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self).capitalized
    }
    
}


extension UIImageView {
    
    func urlToImage(imageURL: String) -> UIImage? {
        guard let photoURL = URL(string: imageURL) else { return nil }
        
        URLSession.shared.dataTask(with: photoURL) { (data, responce, error) in
            
            if let error = error {
                print("Data task error. \(error)")
                return
            }
            
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
                return
            }
            
        }.resume()
        
        return self.image
    }
    
    
}

extension UIView {

    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0, paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
        }
        
        if let bottom = bottom {
            if let paddingBottom = paddingBottom {
                bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
        }
        
        if let right = right {
            if let paddingRight = paddingRight {
                rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
extension UITextField {
    
    func setBottomBorder(string: String) {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: self.frame.height+100))
        self.leftView = paddingView
        self.leftViewMode = .always
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.borderStyle = .none
        self.attributedPlaceholder = NSAttributedString(string: string, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
}



