//
//  ExString.swift
//  ReplacementText
//
//  Created by t&a on 2024/03/05.
//

import UIKit

extension String {
    
    /// ダイアログ表示用の文字数を制限
    public var limitLength: String { self.count <= 5 ? self : self.prefix(5) + "..." }
}

