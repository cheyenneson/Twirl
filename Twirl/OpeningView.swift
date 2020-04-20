//
//  OpeningView.swift
//  Twirl
//
//  Created by Cheyenne Son Davis on 4/19/20.
//  Copyright © 2020 Cheyenne Son Davis. All rights reserved.
//

import SwiftUI

struct OpeningView: View {
    @State var extentionsSelected = false
    @State var turnoutSelected = false
    @State var feetSelected = false
    @State var leapsSelected = false
    @State var corpsSelected = false
    
    var body: some View {
        VStack {
            Text("Welcome")
                .font(.title)
                .fontWeight(.bold)
                .frame(alignment: .center)
                .foregroundColor(.gray)
            Text("Select three areas in which you want to improve")
                .font(.title)
                .fontWeight(.light)
                .frame(maxWidth: 250, alignment: .center)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 128)
            HStack {
                Button(action: {
                    self.leapsSelected.toggle()
                }) {
                    Group { // LEAPS
                        VStack {
                            Image("leaps").resizable()
                                .frame(width: 70.0, height: 72.0)

                            Text("leaps")
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .font(.system(size: 20.0))
                        }
                    }
                    .frame(width: 128.0, height: 128.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(self.leapsSelected ? Color.pink : Color.white, lineWidth: 3)
                    )
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    self.corpsSelected.toggle()
                }) {
                    Group {
                        VStack { // PORT DE CORPS
                            Image("portdecorps")
                                .resizable()
                                .frame(width: 48.0, height: 72.0)

                            Text("port de corps")
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .font(.system(size: 20.0))
                        }
                    }
                    .frame(width: 128.0, height: 128.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(self.corpsSelected ? Color.pink : Color.white, lineWidth: 3)
                    )
                }
                .buttonStyle(PlainButtonStyle())

                Button(action: {
                    self.feetSelected.toggle()
                }) {
                    Group {
                        VStack { // FEET
                            Image("feet").resizable()
                                .frame(width: 84.0, height: 72.0)

                            Text("feet")
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .font(.system(size: 20.0))
                        }
                    }
                    .frame(width: 128.0, height: 128.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(self.feetSelected ? Color.pink : Color.white, lineWidth: 3)
                    )
                }
                .buttonStyle(PlainButtonStyle())

            }
            .frame(height: 40)
            .padding()
            
            Spacer()
                .frame(height: 64)
            
            HStack {
                Button(action: {
                    self.turnoutSelected.toggle()
                }) {
                    Group { // TURNOUT
                        VStack {
                            Image("turnout").resizable()
                                .frame(width: 56.0, height: 72.0)

                            Text("turnout")
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .font(.system(size: 20.0))
                        }
                    }
                    .frame(width: 128.0, height: 128.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(self.turnoutSelected ? Color.pink : Color.white, lineWidth: 3)
                    )
                }
                .buttonStyle(PlainButtonStyle())

                Button(action: {
                    self.extentionsSelected.toggle()
                }) {
                    Group {
                        VStack { // EXTENSIONS
                            Image("extensions").resizable()
                                .frame(width: 40.0, height: 72.0)

                            Text("extensions")
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .font(.system(size: 20.0))
                        }
                    }
                    .frame(width: 128.0, height: 128.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(self.extentionsSelected ? Color.pink : Color.white, lineWidth: 3)
                    )
                }
                .buttonStyle(PlainButtonStyle())

            }
            .frame(height: 40)
            .padding()

            Spacer()
                .frame(height: 160)
        }
    }
        
}

struct OpeningView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningView()
    }
}
