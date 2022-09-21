//
//  BackgroundColorHelper.swift
//  TodoList
//
//  Created by 이승준 on 2022/09/21.
//

import UIKit

enum BackgroundColor: Int64 {
    case red = 1, green, blue, purple
    
    public var getBackgroundColor {
        switch self {
        case .red:
            return UIColor(red: , green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: 1)
        case .green:
            return UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: 1)
        case .blue:
            return UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: 1)
        case .purple:
            return UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: 1)
        }
    }
}
