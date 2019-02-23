//
//  DateUtility.swift
//  Tarea-3
//
//  Created by Gupps on 2/20/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import Foundation


extension Date {
    func getFormatted(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        let localizedDate = formatter.string(from: self as Date)
        return localizedDate
    }
}
