//
//  BackgroundColorHelper.swift
//  TodoList
//
//  Created by 이승준 on 2022/09/21.
//

import UIKit

enum BackgroundColor: Int64 {
    case red = 1, green, blue, purple
    
    public var getBackgroundColor: UIColor? {
        switch self {
        case .red:
            return UIColor(hexString: "#F25A5A")
        case .green:
            return UIColor(hexString: "#82F6A1")
        case .blue:
            return UIColor(hexString: "#9AE1FF")
        case .purple:
            return UIColor(hexString: "#C6ACFA")
        default:
            return UIColor.red
        }
    }
    
    public var getBtnColor: UIColor? {
        switch self {
        case .red:
            return UIColor(hexString: "#F25A5A")
        case .green:
            return UIColor(hexString: "#82F6A1")
        case .blue:
            return UIColor(hexString: "#9AE1FF")
        case .purple:
            return UIColor(hexString: "#C6ACFA")
        }
    }
}
