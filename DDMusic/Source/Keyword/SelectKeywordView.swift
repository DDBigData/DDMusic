//
//  SelectKeywordView.swift
//  DDMusic
//
//  Created by 남경민 on 12/8/23.
//

import SwiftUI

struct SelectKeywordView: View {
    let keyword = [
        "#스트레스",
        "#도전",
        "#열정",
        "#감성힙합",
        "#국내힙합",
        "#감성",
        "#감성적인",
        "#위로",
        "#응원",
        "#힘이_되어주는",
        "#아이돌그룹",
        "#알앤비",
        "#무드",
        "#분위기",
        "#선선한",
        "#밤",
        "#산책",
        "#기분전환",
        "#R",
        "#잠",
        "#편안한",
        "#휴식",
        "#새벽",
        "#잔잔한",
        "#힐링",
        "#LP",
        "#명곡",
        "#막걸리",
        "#매장음악추천",
        "#전집",
        "#매장음악",
        "#소주",
        "#대학로",
        "#도입부",
        "#그루브",
        "#센치",
        "#띵곡",
        "#좋은",
        "#내취향",
        "#신나는",
        "#아이돌",
        "#중독성",
        "#kpop",
        "#노래방",
        "#애창곡"
    ]
    @State var selected : [String] = []
    var body: some View {
        ZStack {
            Image("splash_bg")
                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                .ignoresSafeArea()
            VStack {
                Text("좋아하는 분위기가 있나요?")
                    .font(.system(size: 38,weight: .bold))
                    .foregroundColor(.white)
                KeywordFlowLayout(keywords: keyword, selectedIndex: $selected)
            }
            .padding(.horizontal, 20)
            
            

        }
    }
}
struct KeywordFlowLayout: View {
    @State private var totalWidth = CGFloat.zero
    var keywords: [String]
    @Binding var selectedIndex : [String]

    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
    }
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        var verticalSpacing: CGFloat = 12
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.keywords.indices, id: \.self) { index in
                KeywordButton(
                    label: self.keywords[index],
                    isSelected: false,
                    action: {
        
                    }
                )
                .padding([.horizontal],4)
                .alignmentGuide(.leading, computeValue: { d in
                    if (abs(width - d.width) > g.size.width)
                    {
                        width = 0
                        height -= d.height + verticalSpacing
                    }
                    let result = width
                    if index < self.keywords.count - 1 {
                        width -= d.width
                    } else {
                        width = 0
                    }
                    return result
                })
                .alignmentGuide(.top, computeValue: { _ in
                    let result = height
                    if width == 0 {
                        //if the item is the last in the row
                        height = 0
                    }
                    return result
                })
            }
        }
    }
}

#Preview {
    SelectKeywordView()
}
