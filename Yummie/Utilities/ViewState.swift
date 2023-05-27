//
//  ViewState.swift
//  Yummie
//
//  Created by Yogesh Patel on 26/05/23.
//

import Foundation

enum ViewState {
    case loading
    case error(message: String)
    case dataLoaded
}
