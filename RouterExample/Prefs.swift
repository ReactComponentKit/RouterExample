//
//  Prefs.swift
//  RouterExample
//
//  Created by burt on 2021/03/05.
//

import Foundation
import Defaults

extension Defaults.Keys {
    static let isFirstLaunch = Key<Bool>("isFirstLaunch", default: true)
}
