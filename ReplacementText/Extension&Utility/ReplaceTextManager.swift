//
//  ReplaceTextManager.swift
//  ReplacementText
//
//  Created by t&a on 2024/03/05.
//

import UIKit

class ReplaceTextManager {

    /// テキスト置換ロジック
    static func replaceString(text: String, before: String, after: String) -> String {
        let result = text.replacingOccurrences(of: before, with: after)
        return result
    }
}
