//
//  Date+Ext.swift
//  GitHubFollowers
//
//  Created by Tei Akpotosu-Nartey on 6/23/22.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
        
    }
}
