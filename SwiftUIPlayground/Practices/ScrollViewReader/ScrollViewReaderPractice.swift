//
//  ScrollViewReaderPractice.swift
//  SwiftUIPlayground
//
//  Created by cody on 5/20/24.
//

import SwiftUI

struct ScrollViewReaderPractice: View {
    var body: some View {
        ScrollViewReader { proxy in
            HStack(spacing: 24) {
                Button {
                    proxy.scrollTo(20, anchor: .topLeading)
                } label: {
                    Text("TopLeading")
                }
                .buttonStyle(.bordered)
                Button {
                    proxy.scrollTo(20, anchor: .top)
                } label: {
                    Text("Top")
                }
                .buttonStyle(.bordered)
                Button {
                    proxy.scrollTo(20, anchor: .topTrailing)
                } label: {
                    Text("TopTrailing")
                }
                .buttonStyle(.bordered)
                
            }
            ScrollView([.horizontal, .vertical]) {
                Group {
                    ForEach(1...40, id: \.self) { count in
                        ZStack {
                            if count == 20 {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            }
                            else {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(.yellow)
                            }
                            Text("\(count)")
                        }
                        .id(count)
                        .frame(width: 40, height: 40)
                    }
                }
            }
            .border(Color.blue)
            HStack(spacing: 24) {
                Button {
                    proxy.scrollTo(20, anchor: .bottomLeading)
                } label: {
                    Text("BottomLeading")
                }
                .buttonStyle(.bordered)
                Button {
                    proxy.scrollTo(20, anchor: .bottom)
                } label: {
                    Text("Bottom")
                }
                .buttonStyle(.bordered)
                Button {
                    proxy.scrollTo(20, anchor: .bottomTrailing)
                } label: {
                    Text("BottomTrailing")
                }
                .buttonStyle(.bordered)
                
            }
        }
    }
}

#Preview {
    ScrollViewReaderPractice()
}
