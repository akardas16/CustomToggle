//
//  IconToggle.swift
//  CombineApp
//
//  Created by Abdullah Kardas on 7.09.2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct IconToggle: View {
    @Binding var status:Bool
    @State var isOpen:Bool
    var iconClose:String = "sun.max.fill"
    var iconClsClr:Color = .white.opacity(0.8)
    var backClose:Color = .black
    
    var iconOpen:String = "moon.stars.fill"
    var iconOpnClr:Color = .orange
    var backOpen:Color = .blue.opacity(0.6)
    
    
    var thumbColor:Color = .white
    var disableIcon:Bool = false
    
  
    
    init(status: Binding<Bool>, iconClose:String = "sun.max.fill", iconClsClr:Color = .white.opacity(0.8), backClose:Color = .black,iconOpen:String = "moon.stars.fill",iconOpnClr:Color = .orange,backOpen:Color = .blue.opacity(0.6),thumbColor:Color = .white,disableIcon:Bool = false) {
        _status = status
        self.isOpen = status.wrappedValue
        self.iconClose = iconClose
        self.iconClsClr = iconClsClr
        self.backClose = backClose
        self.iconOpen = iconOpen
        
        self.iconOpnClr = iconOpnClr
        self.backOpen = backOpen
        self.thumbColor = thumbColor
        self.disableIcon = disableIcon
    }
    
    var body: some View {
        Capsule(style: .continuous)
            .fill(isOpen ? backOpen:backClose)
            .animation(.default, value: isOpen)
            .frame(width: 65, height: 36)
            .overlay(alignment: isOpen ? .trailing:.leading) {
                Circle().fill(thumbColor).padding(4)
            }
            .overlay(alignment: .center, content: {
                if !disableIcon {
                    HStack {
                        Spacer()
                        Image(systemName: iconClose).font(.callout).foregroundColor(iconOpnClr)
                            .hide(isHide: Binding<Bool>(get: {return !isOpen},
                                                                  set: { p in isOpen = p}))
                            .scaleEffect(isOpen ? 1:0.3)
                        Spacer()
                        Image(systemName: iconOpen).font(.callout).foregroundColor(iconClsClr)
                            .hide(isHide: $isOpen)
                            .scaleEffect(!isOpen ? 1:0.3)
                        Spacer()
                    }
                }
            })
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
struct IconToggle_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            IconToggle(status: .constant(false))
        } else {
            // Fallback on earlier versions
        }
    }
}
