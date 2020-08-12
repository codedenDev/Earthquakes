//
//  UIColor.swift
//  Earthquakes
//
//  Created by Richard Kelly on 05/08/2020.
//  Copyright © 2020 Richard Kelly. All rights reserved.
//

import UIKit
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex:Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let alpha, red, green, blue: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (alpha, red, green, blue) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: CGFloat(alpha) / 255)
    }
    
    //MARK:- Font Colors
    struct Font {
      

        static let darkGreen = { return UIColor(hexString:"#596e79") }()
        static let darkBrown = { return UIColor(hexString:"#C7B198") }()
        static let sandBrown = { return UIColor(hexString:"#DFD3C3") }()
        static let dustBrown = { return UIColor(hexString:"#F0ECE2") }()
        static let warning = { return UIColor(hexString:"#ffd634") }()
        static let alertColor = { return UIColor(hexString:"#fc2a2d") }()
        static let navRed = { return UIColor(hexString:"#B20700") }()
   
        
        
        
        
//        static let tintColor = UIColor(red: 0.169, green: 0.325, blue: 0.557, alpha: 1.0)
//        static let selectedCellStatic = UIColor(red: 0.286, green: 0.678, blue: 0.882, alpha: 0.4)
//        static let lightBlue = UIColor(red:0,  green:0.643,  blue:0.890, alpha:1)
    }

//    struct HeaderBackground {
//        static let backgroundColor = { return UIColor(hexString:"E5E5E5") }()
//    }
}
