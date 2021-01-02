//
//  ContentView.swift
//  Tinder Swipe
//
//  Created by 中筋淳朗 on 2020/12/11.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Property
    
    let circleWidth = UIScreen.screenWidth * 1.7
    
    @ObservedObject var manager = UserManager()
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            Circle()
                .fill(Color.pinkGradient)
                .scaleEffect(1.7)
                .offset(y: -circleWidth / 2 - 130)
            
            VStack {
                
                // MARK: - Top Bar
                HStack (spacing: 12) {
                    Text("Discover")
                        .font(.system(size: 34, weight: .bold))
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: "person")
                        .font(.system(size: 24))
                    
                    Image(systemName: "bell")
                        .font(.system(size: 24))
                } //: HStack
                .foregroundColor(.white)
                .padding()
                .padding(.top, 10)
                
                // MARK: - Card View
                GeometryReader(content: { geometry in
                    ZStack {
                        ForEach(manager.data.reversed()) { user in
                            CardView(width: geometry.frame(in: .global).width, user: user, manager: manager)
                                // スワイプ用
                                .rotationEffect(Angle(degrees: Double(14 * user.offset / 500)))
                                .offset(x: user.offset)
                                // gesture
                                .gesture(
                                    DragGesture(minimumDistance: 0)
                                        .onChanged({ value in
                                            swipeCard(value: value, user: user)
                                        })
                                        .onEnded({ value in
                                            endSwipe(value: value, user: user)
                                        })
                                ) //: gesture
                        } //: ForEach
                    } //: ZStack
                }) //: GeometryReader
                .padding(.horizontal, 40)
                .padding(.top, 20)
                
                Spacer()
                
                // MARK: - Bottom Button
                BottomButtons(manager: manager)
                    .padding(.bottom, 20)
                
            } //: VStack
        } //: ZStack
    }
    
    
    // MARK: - Function
    
    func swipeCard(value: DragGesture.Value, user: User) {
        let moveX = value.translation.width
        
        if let index = manager.data.firstIndex(where: { $0.id == user.id }) {
            manager.data[index].offset = moveX
        }
    }
    
    func endSwipe(value: DragGesture.Value, user: User) {
        if let index = manager.data.firstIndex(where: { $0.id == user.id }) {
            withAnimation (.spring(response: 0.55, dampingFraction: 0.65)) {
                // スワイプが小さい場合
                if abs(manager.data[index].offset) <= 150 {
                    manager.data[index].offset = 0
                }
                // 右スワイプ
                else if manager.data[index].offset > 150 {
                    manager.likeCard(user: user)
                }
                // 左スワイプ
                else if manager.data[index].offset < -150 {
                    manager.dislikeCard(user: user)
                }
            }
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
