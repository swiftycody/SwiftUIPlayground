//
//  BottomSheetModifier.swift
//  SwiftUIPlayground
//
//  Created by solgoon on 8/24/24.
//

import SwiftUI

extension View {
    func bottomSheet<SheetContent: View>(isShowing: Binding<Bool>, @ViewBuilder sheetContent: @escaping () -> SheetContent) -> some View {
        self.modifier(BottomSheetModifier(isShowing: isShowing, sheetContent: sheetContent))
    }
}

struct BottomSheetModifier<SheetContent: View>: ViewModifier {
    @Binding var isShowing: Bool
    let sheetContent: () -> SheetContent
    
    @State private var sheetHeight: CGFloat = 0
    @State private var dragOffset: CGFloat = 0
    private var bottomSheetOffset: CGFloat {
        isShowing ? 0 : sheetHeight
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isShowing {
                // BottomSheet의 배경
                Color.black.opacity(0.1)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isShowing = false
                        }
                    }
                    .transition(.opacity)
            }
            
            // BottomSheet
            VStack {
                Spacer()
                VStack(spacing: 0) {
                    Rectangle() // BottomSheet의 핸들
                        .frame(width: 50, height: 4)
                        .cornerRadius(2, corners: [.allCorners])
                        .padding(.vertical, 8)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    // NOTE:  DragGesture는 아래방향이 +, 윗방향이 -로 height값이 됨
                                    if dragOffset + value.translation.height > 0 {
                                        // NOTE: 직전에 준 value로부터 얼마나 이동했는지 값을 주기 때문에, 이전 value에 새 value를 더해야 자연스럽게 움직여짐.
                                        dragOffset = dragOffset + value.translation.height
                                    }
                                }
                                .onEnded { value in
                                    if value.translation.height > 0 {
                                        isShowing = false
                                    } else {
                                        isShowing = true
                                    }
                                    dragOffset = 0
                                }
                        )
                    
                    sheetContent() // BottomSheet의 content
                        .frame(maxHeight: UIScreen.main.bounds.height - 150.0)
                        .fixedSize(horizontal: false, vertical: true) // NOTE: frame(max...)적용 후 fixedSize 적용하면 내부 컨텐츠 크기에 맞게 적용시켜줌.
                        .padding(.top)
                }
                .background( // NOTE: 크기를 알고 싶은 View의 background로 GeometryReader를 넣으면 크기를 알 수 있다
                    GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                sheetHeight = geometry.size.height
                            }
                    })
                .background(Color.white)
                .frame(maxWidth: .infinity)
                .cornerRadius(20, corners: [.topLeft, .topRight]) // NOTE: depricated가 떠서 새로 만듦
                .offset(y: bottomSheetOffset + dragOffset)
                .animation(.easeInOut(duration: 0.25), value: isShowing)
                .shadow(radius: 10)
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}
