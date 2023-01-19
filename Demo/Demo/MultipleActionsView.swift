//
//  MultipleActionsView.swift
//  Demo
//
//  Created by aa on 2023/1/19.
//

import SwiftUI
import FunnyButton_SwiftUI

struct MultipleActionsView: View {
    static let title = "Multiple actions"
    
    @State var xFlag = false
    @State var yFlag = false
    @State var zFlag = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("点击笑脸选择转轴")
                .foregroundColor(.primary)
            
            Text("Rotation")
                .font(.largeTitle)
                .foregroundColor(.orange)
                .shadow(color: .orange.opacity(0.3), radius: 8)
                .rotation3DEffect(Angle(degrees: xFlag ? 360 : 0),
                                  axis: (x: 1, y: 0, z: 0))
                .rotation3DEffect(Angle(degrees: yFlag ? 360 : 0),
                                  axis: (x: 0, y: 1, z: 0))
                .rotation3DEffect(Angle(degrees: zFlag ? 360 : 0),
                                  axis: (x: 0, y: 0, z: 1))
        }
        .navigationBarTitle(Self.title, displayMode: .inline)
        .funnyActions {[
            FunnyAction(name: "X-axis") {
                springAnimation { xFlag.toggle() }
            },
            FunnyAction(name: "Y-axis") {
                springAnimation { yFlag.toggle() }
            },
            FunnyAction(name: "Z-axis") {
                springAnimation { zFlag.toggle() }
            },
        ]}
    }
    
    func springAnimation(_ body: () -> ()) {
        withAnimation(
            .spring(response: 0.6,
                    dampingFraction: 0.2,
                    blendDuration: 0.25),
            body
        )
    }
}

struct MultipleActionsView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleActionsView()
    }
}
