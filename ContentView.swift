//
//  ContentView.swift

//
//  Created by Abdullah Kardas on 7.09.2022.
//


import SwiftUI
import CustomToggle


// An example view showing the style in action
struct ContentView: View {
    @State var isOpen:Bool = false
    
    var body: some View {
        VStack(spacing:24) {
        
            Spacer()
            HStack{
                Spacer()
                VStack {
                    Text("Style 1").bold()
                    BounceToggle(status: $isOpen, colorClose: .gray, colorOpen: .brown, thumbColor: .white)
                        .scaleEffect(1.8).padding()
                }
                Spacer()
                VStack {
                    Text("Style 2").bold()
                    BounceToggle(status: $isOpen, colorClose: .cyan, colorOpen: .teal, thumbColor: .white,enableLine: true)
                        .scaleEffect(1.8).padding()
                }
                Spacer()
            }
            
            HStack{
                Spacer()
                VStack {
                    Text("Style 3").bold()
                    IconToggle(status: $isOpen)
                        .scaleEffect(1.8).padding()
                }
                Spacer()
                VStack {
                    Text("Style 3").bold()
                    IconToggle(status: $isOpen, iconClose: "lock.fill", iconClsClr: .white, backClose: .red, iconOpen: "lock.open.fill", iconOpnClr: .white, backOpen: .green, thumbColor: .white)
                        .scaleEffect(1.8).padding()
                }
                Spacer()
            }
       
            HStack{
                Spacer()
                VStack {
                    Text("Style 4").bold()
                    IconToggle(status: $isOpen, backClose: .gray.opacity(0.4), backOpen: .indigo.opacity(0.8), thumbColor: .cyan,disableIcon: true)
                        .scaleEffect(1.8).padding()
                }
                Spacer()
                VStack {
                    Text("Style 5").bold()
                    ThumbToggle(status: $isOpen, backClose: .orange, backOpen: .black, thumbColor: .white)
                        .scaleEffect(1.8).padding()
                }
                Spacer()
            }
            
            Spacer()
            Capsule(style: .continuous).fill(.blue).padding().frame(width: 200, height: 80).overlay {
                Text("Toggle").bold().foregroundColor(.white)
            }.onTapGesture {
                isOpen.toggle()
            }
            Spacer()
            
            
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif



