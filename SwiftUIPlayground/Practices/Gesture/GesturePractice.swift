//
//  GesturePractice.swift
//  SwiftUIPlayground
//
//  Created by solgoon on 8/24/24.
//

import SwiftUI

struct GesturePractice: View {
    @State var size: CGSize = .zero
    @State var condition: String = "Normal"
    @State var tapCount: Int = 0
    
    var body: some View {
        VStack {
            Text("Drag \(size)")
            Text("\(condition)")
        }
        .gesture(
            DragGesture() // 드래그 제스쳐
                .onChanged { // 드래그 중
                    // NOTE:  DragGesture의 height값은 아래방향이 +, 윗방향이 -
                    condition = "Drag onChanged: \($0.translation.height > 0 ? "아래로" : "위로")"
                    setSize($0.translation)
                }
                .onEnded { // 드래그 끝
                    condition = "Drag onEnded"
                    setSize($0.translation)
                }
        )
        .gesture( // 제스쳐를 중첩시켜 적용
            TapGesture() // 탭 제스쳐
                .onEnded { // TapGeture는 onEnded 이벤트만 들어옴
                    tapCount += 1
                    condition = "\(tapCount) Tap!!"
                }
        )
        .onLongPressGesture(minimumDuration: 2, perform: {
            condition = "onPressingChanged perform"
        }, onPressingChanged: { isPressed in
            condition = "onPressingChanged \(isPressed)"
        })
//        .gesture(
//            LongPressGesture(minimumDuration: 1) // 롱프레스 제스쳐
//                .onEnded { _ in condition = "Long Press end" }
//        )
    }
    
    func setSize(_ size: CGSize) {
        print(size)
        let width = CGFloat(Int(size.width))
        let height = CGFloat(Int(size.height))
        self.size = CGSize(width: width, height: height)
    }
}

#Preview {
    GesturePractice()
}
