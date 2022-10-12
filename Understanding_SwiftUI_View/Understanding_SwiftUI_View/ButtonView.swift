//
//  ButtonView.swift
//  Understanding_SwiftUI_View
//
//  Created by Kay on 2022/10/11.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button {
            print("Button tapped!")
        } label: {
            Text("Click me!")
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(.white)
        }
        .padding()
        .frame(height: 100)
        .background(.pink)
        .cornerRadius(20)
        .opacity(1.0)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
