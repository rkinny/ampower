//
//  ContentView.swift
//  communicATE
//
//  Created by Diya Dinesh on 2/2/24.
//

import SwiftUI

struct ContentView: View {
    var button_background_color = UIColor(
        red: CGFloat((0x215492 & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((0x215492 & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(0x215492 & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
    let button_blue = Color(red:33/255.0,green:84/255.0,blue:146/255.0)
    var body: some View {
        NavigationView{
            VStack (spacing: 10){
                Text("AMPOWER").font(.custom("BubbleNorthRegular", size: 60)).foregroundStyle(button_blue)
                Image("speaker").resizable()
                    .scaledToFit().frame(width: 100.0, height: 100.0)
                /*Text ("communicATE")
                    .font(.custom("BubbleNorthRegular", size: 16))
                    .fontWeight(.heavy)
                    .padding().foregroundStyle(button_blue)*/
                Spacer ()
                    .frame(width: 0.0, height: -10.0)
                NavigationLink(destination:CommunicationBoard()){
                    Text("Communication Board").padding().frame(width:300, height:150, alignment: .center).background(Color.white)
                        .font(.custom("BubbleNorthRegular", size: 32))
                        .foregroundStyle(button_blue).cornerRadius(50).shadow(color: button_blue, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 7, y: 7)
                }
                NavigationLink(destination:ViewControllerView()){
                    Text("Emotions Detector").frame(width:300, height:150, alignment: .center).font(.custom("BubbleNorthRegular", size: 32)).background(Color.white).foregroundStyle(button_blue).cornerRadius(50).shadow(color: button_blue, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 7, y: 7)
                }
                NavigationLink(destination:ViewControllerViewTwo()){
                    Text("Sign Language to Text").frame(width:300, height:150, alignment: .center).font(.custom("BubbleNorthRegular", size: 32)).background(Color.white).foregroundStyle(button_blue).cornerRadius(50).shadow(color: button_blue, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 7, y: 7)
                }
            }
        }
        
        /*.onAppear {

                   for family in UIFont.familyNames.sorted() {
                       print("Family: \(family)")
                       
                       let names = UIFont.fontNames(forFamilyName: family)
                       for fontName in names {
                           print("- \(fontName)")
                       }
                   }
               }
               .padding()*/
        
    }
    
    
}

#Preview {
    ContentView()
}
