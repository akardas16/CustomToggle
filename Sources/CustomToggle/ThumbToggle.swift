//
//  ThumbToggle.swift
//  CombineApp
//
//  Created by Abdullah Kardas on 8.09.2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct ThumbToggle: View {
    
    @Binding var status:Bool
    @State var isOpen:Bool
    var iconClose:String = "sun.max.fill"
    var iconClsClr:Color = .black.opacity(0.8)
    var backClose:Color = .black
    
    var iconOpen:String = "moon.stars.fill"
    var iconOpnClr:Color = .orange
    var backOpen:Color = .blue.opacity(0.6)
    
    
    var thumbColor:Color = .white
        
  
    
    init(status: Binding<Bool>, iconClose:String = "sun.max.fill", iconClsClr:Color = .orange, backClose:Color = .black,iconOpen:String = "moon.stars.fill",iconOpnClr:Color = .black.opacity(0.8),backOpen:Color = .blue.opacity(0.6),thumbColor:Color = .white) {
        _status = status
        self.isOpen = status.wrappedValue
        self.iconClose = iconClose
        self.iconClsClr = iconClsClr
        self.backClose = backClose
        self.iconOpen = iconOpen
        
        self.iconOpnClr = iconOpnClr
        self.backOpen = backOpen
        self.thumbColor = thumbColor
        
    }
    
    var body: some View {
        Capsule(style: .continuous)
            .fill(isOpen ? backOpen:backClose)
            .animation(.default, value: isOpen)
            .frame(width: 65, height: 36)
            .overlay(alignment: isOpen ? .trailing:.leading) {
                Circle().fill(thumbColor).padding(4).overlay {
                    Image(systemName: isOpen ? iconOpen:iconClose)
                        .font(.callout).foregroundColor(isOpen ? iconOpnClr:iconClsClr)
                        .animation(.default, value: isOpen)
                }
            }
            
            .onTapGesture {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.52)) {
                    status.toggle()
                }
            }.onChange(of: status) { newValue in
                withAnimation(.spring(response: 0.6, dampingFraction: 0.52)) {
                    isOpen = newValue
                }
            }
    }
}

@available(iOS 13.0.0, *)
struct ThumbToggle_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ThumbToggle(status: .constant(false))
        } else {
            // Fallback on earlier versions
        }
    }
}
