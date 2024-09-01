//
//  SomeSwiftUIView.swift
//  SwiftUIPlayground
//
//  Created by cody on 5/14/24.
//

import SwiftUI

struct SomeSwiftUIView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("geometry 정보")
                    .font(.title)
                Text("size: ").bold() + Text("\(geometry.size)")
                Text("frame: ").bold() + Text("\(geometry.frame(in: .local).dictionaryRepresentation)")
                Text("safeAreaInsets: ").bold() + Text("\(geometry.safeAreaInsets)")
            }
            .padding()
        }
        .border(Color.blue, width: 3)
    }
}

#Preview {
    SomeSwiftUIView()
}
