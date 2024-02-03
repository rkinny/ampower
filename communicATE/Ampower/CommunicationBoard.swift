//
//  CommunicationBoard.swift
//  communicATE
//
//  Created by Diya Dinesh on 2/2/24.
//

import SwiftUI

struct CommunicationBoard: View {
    @State var textToUpdate = " "
    let button_blue = Color(red:33/255.0,green:84/255.0,blue:146/255.0)

    var body: some View {
        VStack (spacing: 20){
            Text(textToUpdate).font(.custom("BubbleNorthRegular", size: 30)).foregroundStyle(button_blue).border(button_blue, width: 1).cornerRadius(10)
            HStack (spacing: 10){
                Button {
                    textToUpdate += "I/I am "
                }label: {
                    Image("I")  .resizable()
                        .scaledToFit().frame(width: 120.0, height: 120.0)
                }.controlSize(.mini)
                
                    Button {
                        textToUpdate += "water "
                        
                    }label: {
                        Image("water")  .resizable()
                            .scaledToFit().frame(width: 120.0, height: 120.0)
                    }.controlSize(.mini)
                
                    Button {
                        textToUpdate += "want "
                    }label: {
                        Image("want")  .resizable()
                            .scaledToFit().frame(width: 120.0, height: 120.0)
                    }.controlSize(.mini)
            }
            HStack (spacing: 10){
                Button {
                    textToUpdate += "yes "
                }label: {
                    Image("yes")  .resizable()
                        .scaledToFit().frame(width: 120.0, height: 120.0)
                }.controlSize(.mini)
                
                Button {
                    textToUpdate += "no "
                }label: {
                    Image("no")  .resizable()
                        .scaledToFit().frame(width: 120.0, height: 120.0)
                }.controlSize(.mini)
                
                Button {
                    textToUpdate += "like "
                }label: {
                    Image("like")  .resizable()
                        .scaledToFit().frame(width: 120.0, height: 120.0)
                }.controlSize(.mini)
            }
            HStack (spacing: 10){
                Button {
                    textToUpdate += "happy "
                }label: {
                    Image("happy")  .resizable()
                        .scaledToFit().frame(width: 120.0, height: 120.0)
                }.controlSize(.mini)
                
                Button {
                    textToUpdate += "stop "
                }label: {
                    Image("stop")  .resizable()
                        .scaledToFit().frame(width: 120.0, height: 120.0)
                }.controlSize(.mini)
                
                Button {
                    textToUpdate += "go "
                }label: {
                    Image("go")  .resizable()
                        .scaledToFit().frame(width: 120.0, height: 120.0)
                }.controlSize(.mini)
            }
            HStack (spacing: 10){
                Button {
                    textToUpdate += "help "
                }label: {
                    Image("help")  .resizable()
                        .scaledToFit().frame(width: 120.0, height: 120.0)
                }.controlSize(.mini)
                
                Button {
                    textToUpdate += "name "
                }label: {
                    Image("name")  .resizable()
                        .scaledToFit().frame(width: 120.0, height: 120.0)
                }.controlSize(.mini)
                
                Button {
                    textToUpdate += "confused "
                }label: {
                    Image("confused")  .resizable()
                        .scaledToFit().frame(width: 120.0, height: 120.0)
                }.controlSize(.mini)
            }
            
            Button {
                textToUpdate = " "
            }label: {
                Text("Reset")
            }.font(.system(size:33))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                        .background(Color.red)
                )
                .foregroundColor(.white)
                .cornerRadius(10)

        }
    }
}

#Preview {
    CommunicationBoard()
}
