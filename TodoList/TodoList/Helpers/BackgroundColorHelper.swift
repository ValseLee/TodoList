//
//  BackgroundColorHelper.swift
//  TodoList
//
//  Created by 이승준 on 2022/09/21.
//

import UIKit

enum BackgroundColor: Int64 {
    case red = 1, green, blue, purple
    
    // MARK: 외않되???
    public var getBackgroundColor: UIColor {
        switch self {
        case .red:
            return UIColor(hex: "#F25A5A")!
        case .green:
            return UIColor(hex: "#82F6A1")!
        case .blue:
            return UIColor(hex: "#9AE1FF")!
        case .purple:
            return UIColor(hex: "#C6ACFA")!
        }
    }
    
    public var getBtnColor: UIColor {
        switch self {
        case .red:
            return UIColor(hex: "#F25A5A")!
        case .green:
            return UIColor(hex: "#82F6A1")!
        case .blue:
            return UIColor(hex: "#9AE1FF")!
        case .purple:
            return UIColor(hex: "#C6ACFA")!
        }
    }
}
