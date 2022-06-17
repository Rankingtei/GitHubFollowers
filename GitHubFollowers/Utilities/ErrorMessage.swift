//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Tei Akpotosu-Nartey on 6/16/22.
//

import Foundation

enum GFError: String, Error{
    case invalidUsername = "This username created an invalid request, please try again"
    case unableToComplete = "unable to complete your request. Please check your internet connection"
    case invalidResponse = "invalid response from the server. please try again"
    case invalidData = "The data from the server was invalid, please try again"
}
