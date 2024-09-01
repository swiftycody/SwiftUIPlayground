//
//  DisclosureGroupPractice.swift
//  SwiftUIPlayground
//
//  Created by solgoon on 8/31/24.
//

import SwiftUI

struct DisclosureGroupPractice: View {
    let data = ["Hello", "World"]
    let subData = ["Enjoy", "Development", "With Swift"]
    @State var isExpandedRoot: Bool = true
    @State var isExpandedSub: Bool = true
    
    var body: some View {
        Form {
            DisclosureGroup("DisclosureGroup", isExpanded: $isExpandedRoot) {
                ForEach(data, id: \.self) { item in
                    Text("\(item)")
                }
                DisclosureGroup("DisclosureGroup Sub", isExpanded: $isExpandedSub) {
                    ForEach(subData, id: \.self) { item in
                        Text("\(item)")
                    }
                }
            }
        }
    }
}

#Preview {
    DisclosureGroupPractice()
}
