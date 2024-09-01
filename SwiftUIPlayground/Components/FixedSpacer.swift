//
//  FixedSpacer.swift
//  SwiftUIPlayground
//
//  Created by solgoon on 8/24/24.
//

import SwiftUI

struct FixedSpacer: View {
    let size: CGFloat
    
    init(_ size: CGFloat = 16) {
        self.size = size
    }
    
    var body: some View {
        Spacer()
            .frame(width: size, height: size)
    }
}

#Preview {
    FixedSpacer(30)
}
