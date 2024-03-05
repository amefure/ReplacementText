//
//  ContentView.swift
//  ReplacementText
//
//  Created by t&a on 2022/11/13.
//

import SwiftUI

struct RootView: View {
    
    @State private var text = ""
    @State private var beforeCharacter = ""
    @State private var afterCharacter = ""

    @State private var showSuccessDialog = false
    @State private var showValidationDialog = false
    @State private var showNotFoundDialog = false
    @State private var showTipsDialog = false
    
    @ObservedObject private var messageAlertVm = MessageBalloonViewModel()
    
    
    var body: some View {
        VStack(spacing: 0){
            
            // MARK: - Title
            HeaderView()
            
            // MARK: - Input
            InputView(
                beforeCharacter: $beforeCharacter,
                afterCharacter: $afterCharacter,
                showTipsDialog: $showTipsDialog
            )
            
            // MARK: - Source Text
            TextEditor(text: $text)
                .padding()
                .border(Color.gray, width: 1)
                .padding()
            
            // MARK: - Action
            ActionView(
                text: $text,
                beforeCharacter: $beforeCharacter,
                afterCharacter: $afterCharacter,
                showSuccessDialog: $showSuccessDialog,
                showValidationDialog: $showValidationDialog,
                showNotFoundDialog: $showNotFoundDialog
            )

            
            // MARK: - Ads
            AdMobBannerView()
                .frame(height: 60)
            
        }.dialog(
            isPresented: $showSuccessDialog,
            title: "Success!!",
            message: "【\(beforeCharacter.limitLength)＞＞＞\(afterCharacter.limitLength)】\n置換しました",
            positiveButtonTitle: "OK",
            positiveAction: { showSuccessDialog = false }
        )
        .dialog(
            isPresented: $showTipsDialog,
            title: "Tips",
            message: "改行を変換したい場合は\n「\\n」と入力してください",
            positiveButtonTitle: "OK",
            positiveAction: { showTipsDialog = false }
        )
        .dialog(
            isPresented: $showValidationDialog,
            title: "ERROR",
            message: "テキストを各項目に入力してください",
            positiveButtonTitle: "OK",
            positiveAction: { showValidationDialog = false }
        )
        .dialog(
            isPresented: $showNotFoundDialog,
            title: "ERROR",
            message: "対象の文字が見つかりませんでした",
            positiveButtonTitle: "OK",
            positiveAction: { showNotFoundDialog = false }
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
