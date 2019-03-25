//
//  DiviceUtlity.swift
//  Proyecto-prototipo
//
//  Created by Gupps on 3/20/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import Foundation
import DeviceKit

final class DeviceUtil{
    
    
    static func devicePortrait() -> [CGFloat] {
        var calulacion:[CGFloat] = []
        var estimateWidth : CGFloat  = 0
        var margin : CGFloat = 0;
        let device = Device()
        switch device {
        case (.simulator(.iPhoneSE)),(.iPhoneSE),(.iPhone5s),(.simulator(.iPhone5s)):
            estimateWidth = 70.0
            margin = 10.0
        case (.simulator(.iPhone6)),(.iPhone6),(.simulator(.iPhone6s)),(.iPhone6s),
             (.simulator(.iPhone7)),(.iPhone7),(.simulator(.iPhone8)),(.iPhone8):
            estimateWidth = 70.0
            margin = 1.0
        case (.simulator(.iPhone6Plus)),(.iPhone6Plus),(.simulator(.iPhone6sPlus)),(.iPhone6sPlus),
             (.simulator(.iPhone7Plus)),(.iPhone7Plus),(.simulator(.iPhone8Plus)),(.iPhone8Plus),
             (.simulator(.iPhoneXr)),(.iPhoneXr),(.simulator(.iPhoneXsMax)),(.iPhoneXsMax):
            estimateWidth = 80.0
            margin = 5.0
            
        case (.simulator(.iPhoneX)),(.iPhoneX),(.simulator(.iPhoneXs)),(.iPhoneXs):
            estimateWidth = 70.0
            margin = 5.0
            
        case (.simulator(.iPad5)),(.iPad5),(.simulator(.iPad6)),(.iPad6),
             (.simulator(.iPadAir)),(.iPadAir),(.simulator(.iPadAir2)),(.iPadAir2),
             (.simulator(.iPadPro9Inch)),(.iPadPro9Inch):
            estimateWidth = 110.0
            margin = 5.0
        case(.simulator(.iPadPro10Inch)),(.iPadPro10Inch),
             (.simulator(.iPadPro12Inch)),(.iPadPro12Inch),
             (.simulator(.iPadPro12Inch2)),(.iPadPro12Inch2),
             (.simulator(.iPadPro12Inch3)),(.iPadPro12Inch3):
            estimateWidth = 190.0
            margin = 10.0
        default:
            estimateWidth=80.0;
        }
        calulacion.append(estimateWidth)
        calulacion.append(margin)
        return calulacion
    }
    
    static func deviceLanScape() -> [CGFloat] {
        var calulacion:[CGFloat] = []
        var estimateWidth : CGFloat  = 0;
        var margin : CGFloat = 0;
        let device = Device();
        switch device {
        case (.simulator(.iPhoneSE)),(.iPhoneSE),(.iPhone5s),(.simulator(.iPhone5s)):
            estimateWidth = 75.0
            margin = 6.0
        case (.simulator(.iPhone6)),(.iPhone6),(.simulator(.iPhone6s)),(.iPhone6s),
             (.simulator(.iPhone7)),(.iPhone7),(.simulator(.iPhone8)),(.iPhone8):
            estimateWidth = 89.0
            margin = 6.0
        case (.simulator(.iPhone6Plus)),(.iPhone6Plus),(.simulator(.iPhone6sPlus)),(.iPhone6sPlus),
             (.simulator(.iPhone7Plus)),(.iPhone7Plus),(.simulator(.iPhone8Plus)),(.iPhone8Plus):
            estimateWidth = 80.0
            margin = 5.0
        case (.simulator(.iPhoneX)),(.iPhoneX),(.simulator(.iPhoneXs)),(.iPhoneXs):
            estimateWidth = 105.5
            margin = 15.0
            
        case (.simulator(.iPhoneXr)),(.iPhoneXr),(.simulator(.iPhoneXsMax)),(.iPhoneXsMax):
            estimateWidth = 90.0
            margin = 7.0
        case (.simulator(.iPad5)),(.iPad5),(.simulator(.iPad6)),(.iPad6),
             (.simulator(.iPadAir)),(.iPadAir),(.simulator(.iPadAir2)),(.iPadAir2),
             (.simulator(.iPadPro9Inch)),(.iPadPro9Inch):
            estimateWidth = 150.0
            margin = 5.0
            
        case (.simulator(.iPadPro10Inch)),(.iPadPro10Inch),
             (.simulator(.iPadPro12Inch)),(.iPadPro12Inch),
             (.simulator(.iPadPro12Inch2)),(.iPadPro12Inch2),
             (.simulator(.iPadPro12Inch3)),(.iPadPro12Inch3):
            estimateWidth = 240.0
            margin = 10.0
        default:
            print("Adios")
        }
        calulacion.append(estimateWidth)
        calulacion.append(margin)
        return calulacion
    }
}
