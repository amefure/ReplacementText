//
//  ColorAsset.swift
//  ReplacementText
//
//  Created by t&a on 2024/03/05.
//

import SwiftUI

enum ColorAsset {
    case exThema
    case exText

    public var thisColor: Color {
        switch self {
        case .exThema:
            return Color("ex_thema")
        case .exText:
            return Color("ex_text")
        }
    }
}

