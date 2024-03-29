//
//  MessageBalloon.swift
//  ReplacementText
//
//  Created by t&a on 2024/03/05.
//

import UIKit

// コピーしました用のメッセージバルーンViewModel
class MessageBalloonViewModel: ObservableObject {
    
    // opacityモディファイアの引数に使用
    @Published var opacity: Double = 10.0
    // 表示/非表示を切り替える用
    @Published var isPreview: Bool = false
    
    private var timer = Timer()
    
    // Double型にキャスト＆opacityモディファイア用の数値に割り算
    public func castOpacity() -> Double {
        Double(self.opacity / 10)
    }
    
    // opacityを徐々に減らすことでアニメーションを実装
    public func vanishMessage(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.opacity = self.opacity - 1.0 // デクリメント
            
            if self.opacity == 0.0 {
                self.isPreview = false  // 非表示
                self.opacity = 10.0     // 初期値リセット
                self.timer.invalidate() // タイマーストップ
            }
        }
    }
}
