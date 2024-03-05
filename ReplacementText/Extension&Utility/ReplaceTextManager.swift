//
//  ReplaceTextManager.swift
//  ReplacementText
//
//  Created by t&a on 2024/03/05.
//

import UIKit

class ReplaceTextManager {

    /// テキスト置換ロジック
    static func replaceString(text: String, beforeCharacter: String, AfterCharacter: String) -> String {
        return text.replacingOccurrences(of: beforeCharacter, with: AfterCharacter)
    }
}
