//
//  FramePractice.swift
//  SwiftUIPlayground
//
//  Created by solgoon on 8/24/24.
//

import SwiftUI

struct FramePractice: View {
    var body: some View {
        
        Text("텍스트")
            .background(Color.orange) // Text의 크기를 체크
            .frame(width: 100, height: 100, alignment: .topLeading)
            .border(Color.blue, width: 2) // frame의 크기를 체크
        
        SomeSubView()
            .fixedSize(horizontal: true, vertical: true) // 자식View에게 고정사이즈(ideal)로 그릴 것을 제안
            .frame(width: 250, height: 250)
            .border(Color.blue, width: 2)
    }
}

struct SomeSubView: View {
    @State var size: CGSize = .zero
    
    var body: some View {
        Group {
            Text("Size: \(size.debugDescription)")
                .frame(minWidth: 100, idealWidth: 150,maxWidth: 200,
                       minHeight: 100, idealHeight: 150, maxHeight: 200)
                .background(Color.orange)
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                self.size = geometry.size
                            }
                    })
        }
    }
}

#Preview {
    FramePractice()
}
