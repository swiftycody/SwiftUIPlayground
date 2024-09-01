//
//  GeometryReaderPractice.swift
//  SwiftUIPlayground
//
//  Created by cody on 5/15/24.
//

import SwiftUI

struct GeometryReaderPractice: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<20) { index in
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.blue)
                        GeometryReader { geometry in
                            Text("frame: \(geometry.frame(in: .named("기준점")).dictionaryRepresentation)")
                                .frame(width: geometry.size.width, height: 150, alignment: .leading)
                                .padding(.horizontal)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 150)
                    }
                    .frame(height: 150)
                    .padding(16)
                }
            }
        }
        .coordinateSpace(name: "기준점")
    }
}

#Preview {
    GeometryReaderPractice()
}
