//
//  GeometryReaderForSize.swift
//  SwiftUIPlayground
//
//  Created by solgoon on 8/24/24.
//

import SwiftUI

struct GeometryReaderForSize: View {
    @State var size: CGSize = .zero
    
    var body: some View {
        Text("Size: \(size.debugDescription)")
            .frame(minWidth: 100, idealWidth: 150,maxWidth: 200,
                   minHeight: 100, idealHeight: 150, maxHeight: 200)
            .background(Color.orange)
            .background(
                // NOTE: size만 알아내기 위해 background에 GeometryReader를 넣을 수 있음
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.size = geometry.size
                        }
                })
    }
}

#Preview {
    GeometryReaderForSize()
}
