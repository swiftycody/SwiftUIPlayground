//
//  StackVsList.swift
//  SwiftUIPlayground
//
//  Created by solgoon on 5/23/24.
//

import SwiftUI

struct StackVsList: View {
    var body: some View {
        HStack {
            ScrollView {
                VStack {
                    ForEach(0..<40) { index in
                        Text("VStack\(index)")
                            .padding()
                            .onAppear {
                                print("VStack\(index)")
                            }
                    }
                }
            }
            .background(Color.blue)
            
            ScrollView {
                LazyVStack {
                    ForEach(0..<40) { index in
                        Text("Lazy\(index)")
                            .padding()
                            .onAppear {
                                print("Lazy\(index)")
                            }
                    }
                }
            }
            .background(Color.yellow)
            
            List {
                ForEach(0..<40) { index in
                    Text("List\(index)")
                        .onAppear {
                            print("List\(index)")
                        }
                }
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    StackVsList()
}
