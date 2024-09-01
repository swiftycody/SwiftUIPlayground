//
//  OverlayedClipShape.swift
//  SwiftUIPlayground
//
//  Created by solgoon on 5/12/24.
//

import SwiftUI

struct OverlayedClipShape: ViewModifier {
    func body(content: Content) -> some View {
        return content
    }
}

extension View {
    func overlayedClipShape(cornerRadius: CGFloat, color: Color) -> some View {
        return self.modifier(OverlayedClipShape())
            .clipShape(
                RoundedRectangle(cornerRadius: cornerRadius)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color(color), lineWidth: 0.5)
            )
    }
}
