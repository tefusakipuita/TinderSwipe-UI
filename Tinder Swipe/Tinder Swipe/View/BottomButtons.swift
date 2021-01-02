//
//  BottomButtons.swift
//  Tinder Swipe
//
//  Created by 中筋淳朗 on 2020/12/11.
//

import SwiftUI

struct BottomButtons: View {
    
    // MARK: - Property
    
    var offsetSecond: CGFloat = -15
    var offsetThird: CGFloat = -35
    
    @ObservedObject var manager: UserManager
    
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            
            // MARK: - Refresh
            Button(action: {}, label: {
                Image("refresh")
            })
            .shadow(color: Color.gray.opacity(0.15), radius: 10, x: 4, y: 4)
            .offset(y: offsetThird)
            
            // MARK: - Dislike
            Button(action: {
                if manager.data.count != 0 {
                    manager.dislikeCard(user: manager.data[0])
                }
            }, label: {
                Image("dislike")
            })
            .shadow(color: Color.gray.opacity(0.15), radius: 10, x: 4, y: 4)
            .offset(y: offsetSecond)
            
            // MARK: - Super_like
            Button(action: {}, label: {
                Image("super_like")
            })
            .shadow(color: Color.gray.opacity(0.15), radius: 10, x: 4, y: 4)
            
            // MARK: - Like
            Button(action: {
                if manager.data.count != 0 {
                    manager.likeCard(user: manager.data[0])
                }
            }, label: {
                Image("like")
            })
            .shadow(color: Color.gray.opacity(0.15), radius: 10, x: 4, y: 4)
            .offset(y: offsetSecond)
            
            // MARK: - Boost
            Button(action: {}, label: {
                Image("boost")
            })
            .shadow(color: Color.gray.opacity(0.15), radius: 10, x: 4, y: 4)
            .offset(y: offsetThird)
        } //: HStack
    }
}

// MARK: - Preview

struct BottomButtons_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
