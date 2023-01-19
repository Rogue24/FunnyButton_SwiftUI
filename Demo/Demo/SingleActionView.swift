//
//  SingleActionView.swift
//  Demo
//
//  Created by aa on 2023/1/19.
//

import SwiftUI
import FunnyButton_SwiftUI

struct SingleActionView: View {
    static let title = "Single action"
    
    @State var isAnimated = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("点击笑脸交换位置")
                .foregroundColor(.primary)
            
            Text("\(isAnimated ? "Right" : "Left")")
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(isAnimated ? Color.pink : Color.blue)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(isAnimated ? .leading : .trailing, 150)
            
            Text("\(isAnimated ? "Left" : "Right")")
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(isAnimated ? Color.blue : Color.pink)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(isAnimated ? .trailing : .leading, 150)
        }
        .navigationBarTitle(Self.title, displayMode: .inline)
        .funnyAction {
            withAnimation(
                .spring(response: 0.5,
                        dampingFraction: 0.6,
                        blendDuration: 0)
            ) { isAnimated.toggle() }
        }
    }
}

struct SingleActionView_Previews: PreviewProvider {
    static var previews: some View {
        SingleActionView()
    }
}
