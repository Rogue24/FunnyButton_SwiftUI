//
//  PresentTestView.swift
//  Demo
//
//  Created by aa on 2023/2/9.
//

import SwiftUI
import FunnyButton_SwiftUI

struct PresentTestView: View {
    let useWay: FunnyUseWay
    
    @Environment(\.presentationMode) var isPresented
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            Text(useWay == .UIWindow ? "点击笑脸👉🏻Dismiss" : "笑脸被覆盖了😔\n点我👉🏻Dismiss")
                .font(.largeTitle)
                .foregroundColor(.primary)
                .onTapGesture {
                    guard useWay == .SwiftUIView else { return }
                    isPresented.wrappedValue.dismiss()
                }
        }
        .navigationBarTitle("Present Test", displayMode: .inline)
        .funnyAction {
            isPresented.wrappedValue.dismiss()
        }
    }
}

struct PresentTestView_Previews: PreviewProvider {
    static var previews: some View {
        PresentTestView(useWay: .SwiftUIView)
    }
}
