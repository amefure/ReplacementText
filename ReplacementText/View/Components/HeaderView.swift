//
//  HeaderView.swift
//  ReplacementText
//
//  Created by t&a on 2024/03/05.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack{
            Text("文字列置換")
            HStack(spacing: 0){
                Image(systemName: "chevron.right")
                Image(systemName: "chevron.right")
                Image(systemName: "chevron.right")
            }
            Text("ReplacementText")
            
        }.frame(width: DeviceSizeManager.deviceWidth)
            .padding()
            .foregroundColor(ColorAsset.exText.thisColor)
            .background(ColorAsset.exThema.thisColor)
    }
}

#Preview {
    HeaderView()
}
