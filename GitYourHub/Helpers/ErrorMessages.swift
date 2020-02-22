//
//  ErrorMessages.swift
//  GitYourHub
//
//  Created by Fahad Almehawas  on 2/20/20.
//  Copyright © 2020 Fahad Al. All rights reserved.
//

import Foundation

enum GitError: String, Error {
    case invalidUsername = "This username created is an invalid request. Try again."
    case unableToComplete = "Unable to complete your request. Try again."
    case invalidResponse = "Invalid response from the server."
    case invalidData = "The data received from the server was invalid. Please try again."
}

