//
//  CorpsView.swift
//  Twirl
//
//  Created by Cheyenne Son Davis on 4/20/20.
//  Copyright © 2020 Cheyenne Son Davis. All rights reserved.
//

// IDEA TO ADD - only show the next step when the first step has been completed

import SwiftUI

struct MultiPicker: View  {

    typealias Label = String
    typealias Entry = String

    let data: [ (Label, [Entry]) ]
    @Binding var selection: [Entry]

    var body: some View {
        GeometryReader { geometry in
            HStack {
                ForEach(0..<self.data.count) { column in
                    Picker(self.data[column].0, selection: self.$selection[column]) {
                        ForEach(0..<self.data[column].1.count) { row in
                            Text(verbatim: self.data[column].1[row])
                            .tag(self.data[column].1[row])
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: geometry.size.width / CGFloat(self.data.count), height: geometry.size.height)
                    .clipped()
                }
            }
        }
    }
}

struct CorpsView: View {
    @State var workout = ""
    @State var easySelected = false
    @State var medSelected = false
    @State var hardSelected = false
    @State var showCheck = false
    
    @State var data: [(String, [String])] = [
        ("Hours", Array(0...10).map { "\($0)" }),
        ("Minutes", Array(0...59).map { "\($0)" }),
        ("Seconds", Array(0...59).map { "\($0)" })
    ]
    @State var selection: [String] = [0, 0, 0].map { "\($0)" }
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("What did you do...", text: $workout)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: 300)
            
            VStack {
                Text("How long did you do this activity?")
                MultiPicker(data: data, selection: $selection).frame(height: 300)
                    .frame(maxWidth: 300, maxHeight: 150)
            }
            
            Text("Intensity")
                .padding()
            HStack {
                Button(action: {
                    self.showCheck = true
                    self.easySelected.toggle()
                    if self.hardSelected {
                        self.hardSelected = false
                    }
                    if self.medSelected {
                        self.medSelected = false
                    }
                }) {
                    Text("Easy")
                        .background(Rectangle()
                            .fill(self.easySelected ? Color.gray : Color.green)
                            .cornerRadius(4)
                            .frame(width: 72, height: 44))
                        .foregroundColor(Color.black)
                }
                    .padding()
                
                Spacer()
                    .frame(maxWidth: 8)
                
                Button(action: {
                    self.medSelected.toggle()
                    self.showCheck = true
                    if self.easySelected {
                        self.easySelected = false
                    }
                    if self.hardSelected {
                        self.hardSelected = false
                    }
                }) {
                    Text("Medium")
                        .background(Rectangle()
                            .fill(self.medSelected ? Color.gray : Color.orange)
                            .cornerRadius(4)
                            .frame(width: 72, height: 44))
                        .foregroundColor(Color.black)
                }
                    .padding()
                
                Spacer()
                    .frame(maxWidth: 8)
                
                Button(action: {
                    self.hardSelected.toggle()
                    self.showCheck = true
                    if self.easySelected {
                        self.easySelected = false
                    }
                    if self.medSelected {
                        self.medSelected = false
                    }
                }) {
                    Text("Hard")
                        .background(Rectangle()
                            .fill(self.hardSelected ? Color.gray : Color.red)
                            .cornerRadius(4)
                            .frame(width: 72, height: 44))
                        .foregroundColor(Color.black)
                }
                    .padding()
            }
            
            Spacer()
            
            Button(action: {
                self.workout = ""
                self.easySelected = false
                self.medSelected = false
                self.hardSelected = false
                self.showCheck = false
                // FIXME - should show a toast or something
            }) {
                Image("check")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            .opacity(self.showCheck ? 1 : 0)
            .offset(x: 124)
            
            Spacer()
        }
    }
}

struct CorpsView_Previews: PreviewProvider {
    static var previews: some View {
        CorpsView()
    }
}
