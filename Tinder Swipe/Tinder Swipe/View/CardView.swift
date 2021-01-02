//
//  CardView.swift
//  Tinder Swipe
//
//  Created by 中筋淳朗 on 2020/12/11.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Property
    
    var width: CGFloat
    
    var user: User
    
    @ObservedObject var manager: UserManager
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack (alignment: .bottom) {
            
            // MARK: - BgImage
            Image(user.imageName)
                .resizable()
                .scaledToFill()
                .clipped()
            
            // MARK: - Gradient Mask
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color.black.opacity(0.001), location: 0.8),
                    .init(color: Color.black.opacity(0.8), location: 1)
                ]),
                startPoint: .top,
                endPoint: .bottom)
            
            // MARK: - Info
            HStack (alignment: .bottom) {
                Text(user.name)
                    .font(.system(size: 28, weight: .bold))
                
                Text(user.age)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.bottom, 2)
                
                Spacer()
            } //: HStack
            .padding(.leading, 20)
            .padding(.bottom, 24)
            .foregroundColor(.white)
            .frame(width: width)
            
            // MARK: - Color Mask
            Group {
                Rectangle()
                    .fill(user.offset > 0 ? Color.green : user.offset < 0 ? Color.pink : Color.clear)
                    .opacity(Double(abs(user.offset) / 500))
                
                VStack {
                    HStack {
                        Text("Like".uppercased())
                            .kerning(2)
                            .font(.system(size: 26, weight: .bold))
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.white, lineWidth: 1)
                                    .scaleEffect(1.4)
                            )
                            .opacity(user.offset > 150 ? 1 : 0)
                            .rotationEffect(Angle(degrees: -24))
                        
                        Spacer()
                        
                        Text("Nope".uppercased())
                            .kerning(2)
                            .font(.system(size: 26, weight: .bold))
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.white, lineWidth: 1)
                                    .scaleEffect(1.4)
                            )
                            .opacity(user.offset < -150 ? 1 : 0)
                            .rotationEffect(Angle(degrees: 24))
                    } //: HStack
                    .padding(32)
                    .padding(.top, 20)
                    
                    Spacer()
                } //: VStack
            } //: Group
            .foregroundColor(.white)
            .frame(width: width)
                
        } //: ZStack
        .frame(width: width, height: width * 1.6)
        .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
