//
//  ActionView.swift
//  ReplacementText
//
//  Created by t&a on 2024/03/05.
//

import SwiftUI

struct ActionView: View {
    
    @Binding var text: String
    @Binding var beforeCharacter: String
    @Binding var afterCharacter: String
    @Binding var showSuccessDialog: Bool
    @Binding var showValidationDialog: Bool
    @Binding var showNotFoundDialog: Bool
    
    @ObservedObject private var messageAlertVm = MessageBalloonViewModel()
    
    var body: some View {
        HStack{
            
            // MARK: - Action
            Button(action: {
                UIApplication.shared.closeKeyboard()
                beforeCharacter = ""
                afterCharacter = ""
                text = ""
            }, label: {
                Image(systemName: "clear.fill")
                    .padding()
                    .background(ColorAsset.exThema.thisColor)
                    .foregroundColor(ColorAsset.exText.thisColor)
                    .cornerRadius(5)
            }).frame(width: 100)
            
            // MARK: - Action
            Button(action: {
                UIApplication.shared.closeKeyboard()
                // バリデーション
                guard !text.isEmpty,
                      !beforeCharacter.isEmpty,
                      !beforeCharacter.isEmpty else {
                    showValidationDialog = true
                    return
                }
                
                // ユーザーが入力した改行コードはエスケープされているので先に改行コードへ置換する
                let before = beforeCharacter.replacingOccurrences(of: "\\n", with: "\n")
                
                // 置換対象文字が存在しない場合
                if !text.contains(before) {
                    showNotFoundDialog = true
                    return
                }
                
                text = ReplaceTextManager.replaceString(
                    text: text,
                    before: before,
                    after: afterCharacter
                )
                showSuccessDialog = true
            }, label: {
                Text("Replace")
                    .padding()
                    .background(ColorAsset.exThema.thisColor)
                    .foregroundStyle(ColorAsset.exText.thisColor)
                    .cornerRadius(5)
            }).padding(8)
            
            // MARK: - Action
            ZStack {
                if messageAlertVm.isPreview {
                    Text("テキストをコピーしました")
                        .font(.system(size: 10))
                        .padding(5)
                        .background(Color(red: 0.3, green: 0.3 ,blue: 0.3))
                        .foregroundColor(.white)
                        .opacity(messageAlertVm.castOpacity())
                        .cornerRadius(5)
                        .offset(x: 0, y: -40)
                }
                
                Button(action: {
                    UIApplication.shared.closeKeyboard()
                    UIPasteboard.general.string = text
                    messageAlertVm.isPreview = true
                    messageAlertVm.vanishMessage()
                }, label: {
                    Image(systemName: "doc.on.doc.fill")
                        .padding()
                        .background(ColorAsset.exThema.thisColor)
                        .foregroundColor(ColorAsset.exText.thisColor)
                        .cornerRadius(5)
                })
            }.frame(width: 100)
            
        }
    }
}

#Preview {
    ActionView(
        text: Binding.constant(""),
        beforeCharacter: Binding.constant(""),
        afterCharacter: Binding.constant(""),
        showSuccessDialog: Binding.constant(false),
        showValidationDialog: Binding.constant(false),
        showNotFoundDialog: Binding.constant(false)
    )
}
