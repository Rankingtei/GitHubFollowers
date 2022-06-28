//
//  String+Ext.swift
//  GitHubFollowers
//
//  Created by Tei Akpotosu-Nartey on 6/23/22.
//

import Foundation

extension String{
    
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_GH")
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
    
    }
    
    func convertToDisplayFormat() -> String{
        guard let date = self.convertToDate() else { return "N/A" }
        return date.convertToMonthYearFormat()
    }
}
