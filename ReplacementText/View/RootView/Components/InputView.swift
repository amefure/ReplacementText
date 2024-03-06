//
//  InputView.swift
//  ReplacementText
//
//  Created by t&a on 2024/03/05.
//

import SwiftUI

struct InputView: View {
    
    @Binding var beforeCharacter: String
    @Binding var afterCharacter: String
    @Binding var showTipsDialog: Bool
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 30)
            
            Spacer()
            
            VStack(alignment:.leading,spacing:3){
                Text("before").padding(.leading,3)
                TextField("before",text: $beforeCharacter).frame(width:80).textFieldStyle(.roundedBorder)
            }
            
            HStack(spacing: 0){
                Image(systemName: "chevron.right")
                Image(systemName: "chevron.right")
                Image(systemName: "chevron.right")
            }.offset(x: 0, y: 10)
                .foregroundColor(Color(red: 35/255, green: 82/255, blue: 124/255))
            
            VStack(alignment:.leading,spacing:3){
                
                Text("after").padding(.leading,3)
                TextField("after",text: $afterCharacter).frame(width:80).textFieldStyle(.roundedBorder)
            }
            
            Spacer()
            
            Button {
                UIApplication.shared.closeKeyboard()
                showTipsDialog = true
            } label: {
                Image(systemName: "questionmark.app")
                    .frame(width: 30)
                    .foregroundStyle(ColorAsset.exThema.thisColor)
            }
            
        }.padding()
    }
}

#Preview {
    InputView(
        beforeCharacter: Binding.constant(""),
        afterCharacter: Binding.constant(""),
        showTipsDialog: Binding.constant(false)
    )
}
