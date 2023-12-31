//
//  Team.swift
//  CombineDemo
//
//  Created by Michal Cichecki on 30/06/2019.
//

import Foundation

struct Team: Decodable, Equatable, Hashable {
    var abbreviation: String
}

extension Team: ExpressibleByStringLiteral {
    init(stringLiteral value: StringLiteralType) {
        self = Team(abbreviation: value)
    }
}
