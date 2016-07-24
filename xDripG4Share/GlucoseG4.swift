//
//  GlucoseG4.swift
//  xDripG4Share
//
//  Created by Mark Wilson on 7/10/16.
//  Copyright © 2016 Mark Wilson. All rights reserved.
//

import Foundation

public struct GlucoseG4 {

    public let sequence: UInt32
    public let glucose: UInt16
    public let isDisplayOnly: Bool
    public let trend: UInt8
    public let time: NSDate
    public let wallTime: NSDate
    public let systemTime: UInt32
    
}

extension GlucoseG4: Equatable {
}

public func ==(lhs: GlucoseG4, rhs: GlucoseG4) -> Bool {
    return lhs.sequence == rhs.sequence
}