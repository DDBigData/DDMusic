//
//  KeywordButton.swift
//  DDMusic
//
//  Created by 남경민 on 12/8/23.
//

import SwiftUI

struct KeywordButton: View {
    let label: String
    var isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: 14,weight: .medium))
                .foregroundColor(.white)
                .padding(.horizontal,16)
                .padding(.vertical,12)
                .frame(height:38)
                .background(isSelected ? Color.keyword_bg : Color.keyword_purple) // 배경색 변경
                .cornerRadius(36)
        }
        
        
    }
}

