//
//  BottomSheetExample.swift
//  SwiftUIPlayground
//
//  Created by solgoon on 8/24/24.
//

import SwiftUI

struct BottomSheetExample: View {
    @State private var isShowing = false
    
    var body: some View {
        VStack {
            ScrollView {
                Button {
                    isShowing.toggle()
                } label: {
                    Text("isShowing: \(isShowing)")
                }

            }
        }
        .bottomSheet(isShowing: $isShowing) {
            ShareToFriendsView(friendsList: sampleFriends, isShowing: $isShowing)
        }
    }
}

#Preview {
    BottomSheetExample()
}

class FriendInfo: ObservableObject, Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var image: ImageResource
    var followers: Int
    @Published var isChecked: Bool
    
    init(name: String, image: ImageResource, followers: Int = 0, isChecked: Bool = false) {
        self.name = name
        self.image = image
        self.followers = followers
        self.isChecked = isChecked
    }
}

struct ShareToFriendsView: View {
    @Environment(\.colorScheme) var colorScheme
    var friendsList: [FriendInfo]
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("친구에게 공유")
                        .textStyle(style: .B18, color: .titleColor(forScheme: colorScheme))
                    Spacer()
                }
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(friendsList) { friendInfo in
                            FriendCell(friendInfo: friendInfo)
                        }
                        FixedSpacer(64)
                    }
                }
            }
            
            VStack {
                Spacer()
                Button {
                    isShowing.toggle()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 16, height: 16))
                            .frame(height: 52)
                            .foregroundStyle(Color.indigo)
                        Text("보내기")
                            .textStyle(style: .B18, color: .white)
                        HStack {
                            Spacer()
                            Image(systemName: "arrow.forward.circle.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color.white)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal, 30)
                
            }
        }
        .background(Color.white)
        .padding()
        .ignoresSafeArea()
        //        .frame(maxHeight: UIScreen.main.bounds.height - 250.0)
        //        .fixedSize(horizontal: false, vertical: true) // NOTE: frame(max...)적용 후 fixedSize 적용하면 내부 컨텐츠 크기에 맞게 적용시켜줌.
    }
}

struct FriendCell: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var friendInfo: FriendInfo
    
    var body: some View {
        Button {
            friendInfo.isChecked.toggle()
        } label: {
            HStack {
                Image(friendInfo.image)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(friendInfo.name)
                        .textStyle(style: .B14, color: .titleColor(forScheme: colorScheme))
                    Text("\(friendInfo.followers) Followers")
                        .textStyle(style: .R12, color: .hex4F4F4F)
                }
                Spacer()
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(friendInfo.isChecked ? Color.indigo : Color.gray)
            }
        }
    }
}
