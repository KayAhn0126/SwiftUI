//
//  ButtonView.swift
//  SwiftUI-Basic
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
        }

    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
