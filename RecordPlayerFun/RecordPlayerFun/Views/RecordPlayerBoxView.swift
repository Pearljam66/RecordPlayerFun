//
//  RecordPlayerBoxView.swift
//  RecordPlayerFun
//
//  Created by Sarah Clark on 7/4/24.
//

import SwiftUI

struct RecordPlayerBoxView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 345, height: 345)
                .cornerRadius(10)
            Image("woodGrain")
                .resizable().frame(width: 325, height: 325)
                .shadow(color: .white, radius: 3, x: 0, y: 0)
        }
    }
}

#Preview {
    RecordPlayerBoxView()
}
