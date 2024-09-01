//
//  TextPractice.swift
//  SwiftUIPlayground
//
//  Created by cody on 5/15/24.
//

import SwiftUI

struct TextPractice: View {
    var body: some View {
        ScrollView {
            
            Text("기본")
                .font(.title)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus tempus sem at congue varius. Nunc vulputate purus eros, vitae venenatis turpis blandit in.")
                .bold()     // 볼드체
                .italic()   // 이텔릭
                .strikethrough(true, color: .blue)  // 취소선
                .underline(true, color: .green)     // 밑줄
                .lineLimit(3) // 줄 제한
                .multilineTextAlignment(.center)    // 텍스트 정렬
                .font(.title3) // 폰트
                .font(.system(size: 12, design: .rounded)) // 폰트
                .foregroundColor(.red) // 색상
                .lineSpacing(10.0)      // 행간
                .tracking(5)    // 자간 (iOS16+)
                .kerning(5)     // 글꼴에 따른 자간 (iOS16+)
            Divider()
            Text("Text끼리 더하기")
                .font(.title)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                .bold()
                .foregroundColor(.orange)
            +
            Text(" Vivamus tempus sem at congue varius.")
                .italic()
                .foregroundColor(.blue)
            +
            Text(" Nunc vulputate purus eros, vitae venenatis turpis blandit in.")
                .strikethrough()
                .foregroundColor(.green)
            Divider()
            Text("AttributedString 적용")
                .font(.title)
            let attributedString: AttributedString = {
                var string = AttributedString("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus tempus sem at congue varius. Nunc vulputate purus eros, vitae venenatis turpis blandit in.")
                
                if let range1 = string.range(of: "Lorem ipsum dolor sit amet,") {
                    string[range1].foregroundColor = UIColor.systemRed
                    string[range1].kern = 5
                }
                
                if let range2 = string.range(of: "consectetur adipiscing elit.") {
                    string[range2].strikethroughStyle = .single
                }
                
                if let range3 = string.range(of: "Vivamus tempus sem at congue varius. ") {
                    string[range3].baselineOffset = 5
                }
                
                if let range4 = string.range(of: "vitae venenatis turpis blandit in.") {
                    string[range4].underlineStyle = .single
                }
                
                return string
            }()
            
            Text(attributedString)
            Divider()
            Text("Text의 Frame")
                .font(.title)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus tempus sem at congue varius. Nunc vulputate purus eros, vitae venenatis turpis blandit in.")
                .background(Color(.yellow))
                .padding(.vertical)
            
            Text("Vestibulum auctor ultrices odio.")
                .frame(maxWidth: .infinity) // 최대 너비를 지정
                .background(Color(.green))
            
            Divider()
            Text("text 선택")
                .textSelection(.enabled)
            
            Divider()
            Text("Markdown")
                .font(.title)
            
            Text("**bold**") // 볼드
            Text("__bold__") // 볼드
            
            Text("*italic*") // 이탤릭
            Text("_italic_") // 이탤릭
            
            Text("***bold italic***") // 볼드 이탤릭
            Text("___bold italic___") // 볼드 이탤릭
            
            Text("~~strikethrough~~") // 취소선
            
            Text("`monospaced`") // monospaced
            
            Text("[link](swifty-cody.tistory.com)") // 링크
            
            let boldString = "**bold**"
            Text(boldString) // 변수는 동작하지 않음
            Text(.init(boldString)) // 변수를 LocalizedStringKey 이니셜라이저로 초기화하면 동작.
            
            Divider()
            Text("reservesSpace")
                .font(.title)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                .lineLimit(5, reservesSpace: true)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
        }
    }
}

#Preview {
    TextPractice()
}
