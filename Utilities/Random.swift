//
//  Random.swift
//  iOSBaseProject
//
//  Created by admin on 16/8/24.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

// MARK: - Extensions of Int, Bool, Float, Double, CGFloat, Color, Array, ArraySlice to add vars or methods about random.

public extension Int {
    /**
     - parameter lower: default -> 0
     - parameter upper: default -> 100
     - returns: lower <= value <= upper
     */
    public static func random(lower: Int = 0, _ upper: Int = 100) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    /**
     - returns: range.startIndex <= value <= range.endIndex
     */
    public static func random(range: Range<Int>) -> Int {
        return Int.random(range.startIndex, range.endIndex - 1)
    }
    
    /// if self == 0, 0; else if self > 0, 0 <= value <= self; else self <= value <= 0
    public var random: Int {
        return Int.random(0, self)
    }
}

public extension Bool {
    /// true or false, randomly~
    public static var random: Bool {
        return arc4random_uniform(2) == 1
    }
}

public extension Double {
    /**
     - parameter lower: default -> 0
     - parameter upper: default -> 100
     - returns: lower <= value <= upper
     */
    public static func random(lower: Double = 0, _ upper: Double = 100) -> Double {
        return (Double(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
    
    /// if self == 0, 0; else if self > 0, 0 <= value <= self; else self <= value <= 0
    public var random: Double {
        return Double.random(0, self)
    }
}

public extension Float {
    /**
     - parameter lower: default -> 0
     - parameter upper: default -> 100
     - returns: lower <= value <= upper
     */
    public static func random(lower: Float = 0, _ upper: Float = 100) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
    
    /// if self == 0, 0; else if self > 0, 0 <= value <= self; else self <= value <= 0
    public var random: Float {
        return Float.random(0, self)
    }
}

public extension CGFloat {
    
    /**
     - parameter lower: default -> 0
     - parameter upper: default -> 100
     - returns: lower <= value <= upper
     */
    public static func random(lower: CGFloat = 0, _ upper: CGFloat = 1) -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (upper - lower) + lower
    }
    
    /// if self == 0, 0; else if self > 0, 0 <= value <= self; else self <= value <= 0
    public var random: CGFloat {
        return CGFloat.random(0, self)
    }
}

public extension Color {
    
    /// A color of random red, green, blue, alpha is 1.
    public static var random: Color {
        return Color(red: CGFloat.random(0, 1),
                     green: CGFloat.random(0, 1),
                     blue: CGFloat.random(0, 1),
                     alpha: 1)
    }
}

public extension Array {
    
    /// a random item in array
    public var randomItem: Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
    
}

public extension ArraySlice {
    
    /// a random item in array slice
    public var randomItem: Element {
        let index = Int.random(self.startIndex, self.endIndex - 1)
        return self[index]
    }
    
}

