//
//  InputView.swift
//  Twirl
//
//  Created by Cheyenne Son Davis on 4/19/20.
//  Copyright © 2020 Cheyenne Son Davis. All rights reserved.
//

import SwiftUI


struct InputView: View {
    @State var feetSelected = false
    @State var corpsSelected = false
    @State var extensionsSelected = false
    @State private var popIn = false
    
    var body: some View {
        VStack {
            Text("Enter workout")
                .font(.title)
                .padding()
            HStack {
                    Button(action: {
                           self.feetSelected.toggle()
                           if self.corpsSelected {
                               self.corpsSelected = false
                           }
                           if self.extensionsSelected {
                               self.extensionsSelected = false
                           }
                       }) {
                           Group {
                               VStack { // FEET
                                   Image("feet").resizable()
                                       .frame(width: 63.0, height: 54.0)

                                   Text("feet")
                                   .fontWeight(.light)
                                   .foregroundColor(.black)
                                   .font(.system(size: 14.0))
                               }
                           }
                           .frame(width: 96.0, height: 96.0)
                           .overlay(
                               RoundedRectangle(cornerRadius: 8)
                                   .stroke(self.feetSelected ? Color.pink : Color.white, lineWidth: 3)
                           )
                       }
                       .buttonStyle(PlainButtonStyle())
                
                    Button(action: {
                        self.corpsSelected.toggle()
                        if self.feetSelected {
                            self.feetSelected = false
                        }
                        if self.extensionsSelected {
                            self.extensionsSelected = false
                        }
                    }) {
                        Group {
                            VStack { // CORPS
                                Image("portdecorps").resizable()
                                    .frame(width: 36.0, height: 54.0)

                                Text("port de corps")
                                .fontWeight(.light)
                                .foregroundColor(.black)
                                .font(.system(size: 14.0))
                            }
                        }
                        .frame(width: 96.0, height: 96.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(self.corpsSelected ? Color.pink : Color.white, lineWidth: 3)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                
                    Button(action: {
                        self.extensionsSelected.toggle()
                        if self.corpsSelected {
                            self.corpsSelected = false
                        }
                        if self.feetSelected {
                            self.feetSelected = false
                        }
                    }) {
                        Group {
                            VStack { // EXTENSIONS
                                Image("extensions").resizable()
                                    .frame(width: 30.0, height: 54.0)

                                Text("extensions")
                                .fontWeight(.light)
                                .foregroundColor(.black)
                                .font(.system(size: 14.0))
                            }
                        }
                        .frame(width: 96.0, height: 96.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(self.extensionsSelected ? Color.pink : Color.white, lineWidth: 3)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .frame(height: 30)
                .padding()
            
            Spacer()
            
            if self.corpsSelected {
                CorpsView()
                .padding()
            }
            if self.feetSelected {
                CorpsView() // FIXME - change later
                .padding()
            }
            if self.extensionsSelected {
                CorpsView()  // FIXME - change later
                .padding()
            }
            
            Spacer()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
