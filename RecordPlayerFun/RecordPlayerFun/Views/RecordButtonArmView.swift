//
//  RecordButtonArmView.swift
//  RecordPlayerFun
//
//  Created by Sarah Clark on 7/4/24.
//

import SwiftUI

struct RecordButtonArmView: View {
    @State private var rotateRecord = false
    @State private var moveArm = false
    @State private var duration = 0.0

    var animateForever: Animation {
        Animation.linear(duration: duration)
            .repeatForever(autoreverses: false)
    }

    var body: some View {
        ZStack {
            Image("record").resizable()
                .frame(width: 280, height: 280)
                .rotationEffect(Angle(degrees: rotateRecord ? 360 : 0.0))
                .animation(animateForever.delay(1.5), value: rotateRecord)
            Image("playerArm").resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .shadow(color:.gray, radius: 2, x: 0, y: 0)
                .rotationEffect(Angle.degrees(-35), anchor: .topTrailing)
                .rotationEffect(Angle.degrees(moveArm ? 8: 0), anchor: .topTrailing)
                .animation(Animation.linear(duration: 2), value: moveArm)
                .offset(x: 75, y: -30)
            Button(action: {
                rotateRecord.toggle()
                if rotateRecord {
                    duration = 0.8
                    moveArm = true
                } else {
                    duration = 0.0
                    moveArm = false
                }
            }) {
                HStack() {
                    if !rotateRecord {
                        Text("Play")
                            .bold()
                            .foregroundStyle(.black)
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.black)
                    } else {
                        Text("Stop")
                            .bold()
                            .foregroundStyle(.black)
                        Image(systemName: "stop.fill")
                            .foregroundStyle(.red)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Capsule().strokeBorder(.black, lineWidth: 2.00))
            }
            .offset(x: -105, y: 135)
        }
    }
}

#Preview {
    RecordButtonArmView()
}
