//
//  OutlineGroupPractice.swift
//  SwiftUIPlayground
//
//  Created by solgoon on 9/1/24.
//

import SwiftUI

struct MenuItem: Hashable, Identifiable {
    var id = UUID().uuidString
    var name: String
    var children: [MenuItem]? = nil
}

struct OutlineGroupPractice: View {
    let data: [MenuItem] = [
        MenuItem(name: "통장",
                 children: [
                    MenuItem(name: "입출금통장"),
                    MenuItem(name: "개인사업자통장"),
                    MenuItem(name: "모임통장"),
                    MenuItem(name: "세이프박스")
                 ]),
        MenuItem(name: "대출",
                 children: [
                    MenuItem(name: "신용", children: [
                        MenuItem(name: "신용대출 받기"),
                        MenuItem(name: "신용대출 갈아타기")
                    ]),
                    MenuItem(name: "사업자", children: [
                        MenuItem(name: "개인사업자 신용대출"),
                        MenuItem(name: "개인사업자 보증서대출")
                    ]),
                    MenuItem(name: "자동차", children: [
                        MenuItem(name: "중고차 구매대출")
                    ])
                 ])
    ]
    
    var body: some View {
        Form {
            OutlineGroup(data, children: \.children) { item in
                Text("\(item.name)")
            }
        }
    }
}

#Preview {
    OutlineGroupPractice()
}
