//
//  NetworkError.swift
//  WatherApp
//
//  Created by Olya Levandivska on 17.05.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL, missingData, UnknownError
}
