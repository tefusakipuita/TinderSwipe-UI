//
//  UserManager.swift
//  Tinder Swipe
//
//  Created by 中筋淳朗 on 2020/12/11.
//

import SwiftUI

class UserManager: ObservableObject {
    
    // MARK: - Property
    
    @Published var data = Data.userData
    
    
    // MARK: - Function
    
    func likeCard(user: User) {
        if let index = data.firstIndex(where: { $0.id == user.id }) {
            withAnimation(.easeOut(duration: 1)) {
                data[index].offset = 500
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                self.data.remove(at: index)
            }
        }
    }
    
    func dislikeCard(user: User) {
        if let index = data.firstIndex(where: { $0.id == user.id }) {
            withAnimation(.easeOut(duration: 1)) {
                data[index].offset = -500
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                self.data.remove(at: index)
            }
        }
    }
}
