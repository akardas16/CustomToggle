//
//  BounceToggle.swift
//  CombineApp
//
//  Created by Abdullah Kardas on 7.09.2022.
//

import SwiftUI


@available(iOS 15, *)
public struct BounceToggle: View {
    @Binding public var status:Bool
    @State public var isOpen:Bool
    @State public var customWidth:CGFloat = 24
    public var colorClose:Color = .purple
    public var colorOpen:Color = .blue.opacity(0.6)
    public var thumbColor:Color = .white
    public var enableLine:Bool = false
    
    public init(status: Binding<Bool>, colorClose: Color = .purple, colorOpen: Color = .blue.opacity(0.6), thumbColor: Color = .white,enableLine:Bool = false) {
        _status = status
        self.isOpen = status.wrappedValue
        self.colorClose = colorClose
        self.colorOpen = colorOpen
        self.thumbColor = thumbColor
        self.enableLine = enableLine
    }
    
    public var body: some View {
        Capsule(style: .continuous)
            .fill(isOpen ? colorOpen:colorClose)
            .animation(.default, value: isOpen)
            .frame(width: 65, height: 36)
            .overlay(content: {
                if enableLine {
                    Capsule(style: .continuous).fill(.thinMaterial).frame(maxWidth: .infinity).frame(maxHeight: 4).padding(.horizontal,6)
                }
            })
            .overlay(alignment: isOpen ? .trailing:.leading) {
                Capsule(style: .continuous).fill(thumbColor).frame(maxWidth: customWidth).padding(6)
            }
            .onTapGesture {
                withAnimation(.default) {
                    customWidth = .infinity
                    status.toggle()
                    withAnimation(.default.delay(0.3)) {
                        customWidth = 24
                    }
                }
            }
            .onChange(of: status) { newValue in
                withAnimation(.default) {
                    customWidth = .infinity
                    isOpen = newValue
                    withAnimation(.default.delay(0.3)) {
                        customWidth = 24
                    }
                }
            }
        
    }
}

@available(iOS 15, *)
struct BounceToggle_Previews: PreviewProvider {
    static var previews: some View {
        BounceToggle(status: .constant(false))
    }
}


@available(iOS 13.0, *)
public struct HiddenView: ViewModifier{
    var isHide:Binding<Bool>
    
    public func body(content: Content) -> some View {
        if isHide.wrappedValue{
            content
                .hidden()
        }
        else{
            content
        }
    }
}

@available(iOS 13.0, *)
extension View{
    func hide(isHide:Binding<Bool>) -> some View{
        return self.modifier(HiddenView(isHide: isHide))
    }
}
