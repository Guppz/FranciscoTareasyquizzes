//
//  Date-Utility.swift
//  Clase-4
//
//  Created by Gupps on 2/17/19.
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
