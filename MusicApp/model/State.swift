//
//  State.swift
//  MusicApp
//
//  Created by Apple on 18.10.2023.
//

import Foundation

enum State: Comparable {
    case good
    case isLoading
    case loadedAll
    case noResults
    case error(String)
}
