//
//  GlucoseHistoryRecord.swift
//  xDripG4Share
//
//  Created by Mark Wilson on 7/10/16.
//  Copyright © 2016 Mark Wilson. All rights reserved.
//

import Foundation

let EGV_VALUE_MASK: UInt16 = 1023
let EGV_DISPLAY_ONLY_MASK: UInt16 = 32768
let EGV_TREND_ARROW_MASK: UInt8 = 15

struct GlucoseHistoryRecord {

    //  0...3  system time
    //  4...7  display time
    //  8...9  glucose
    // 10...10 trend
    // 11...12 CRC
    static let length = 13

    let sequence: UInt32
    let systemTime: UInt32
    let wallTime: NSDate!
    let glucose: UInt16
    let isDisplayOnly: Bool
    let trend: UInt8

    init?(data: NSData, index: UInt32) {
        guard data.length == self.dynamicType.length && data.crcValid() else {
            return nil
        }

        sequence = index
        systemTime = data[0...3]
        wallTime = NSDate.fromDexcomSystemTime(data[4...7])
        glucose = data[8...9] & EGV_VALUE_MASK
        isDisplayOnly = data[8...9] & EGV_DISPLAY_ONLY_MASK > 0
        trend = data[10] & EGV_TREND_ARROW_MASK
    }
    
}