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

struct Toast<Presenting>: View where Presenting: View {

    /// The binding that decides the appropriate drawing in the body.
    @Binding var isShowing: Bool
    /// The view that will be "presenting" this toast
    let presenting: () -> Presenting
    /// The text to show
    let text: Text

    var body: some View {

        GeometryReader { geometry in

            ZStack(alignment: .center) {

                self.presenting()
                    .blur(radius: self.isShowing ? 1 : 0)

                VStack {
                    self.text
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.pink)
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .transition(.slide)
                    .opacity(self.isShowing ? 0.8 : 0)
                .multilineTextAlignment(.center)
                .font(.title)
            }

        }

    }

}

extension View {

    func toast(isShowing: Binding<Bool>, text: Text) -> some View {
        Toast(isShowing: isShowing,
              presenting: { self },
              text: text)
    }

}

struct CorpsView: View {
    @State var workout = ""
    @State var easySelected = false
    @State var medSelected = false
    @State var hardSelected = false
    @State var showCheck = false
    
    @State var data: [(String, [String])] = [
        ("Hours", Array(0...10).map { "\($0) Hours" }),
        ("Minutes", Array(0...59).map { "\($0) Minutes" })
    ]
    @State var selection: [String] = [0, 0, 0].map { "\($0)" }
    
    @State var hiit = false
    @State var run = false
    @State var yoga = false
    @State var band = false
    @State var stretch = false
    @State var cal = false // calisthenics
    @State var weight = false
    @State var pilates = false
    @State var zumba = false
    
    @State var showToast: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Divider()
                .frame(maxWidth: 300)
                Text("Intensity")
                .font(.system(size: 16, weight: .heavy, design: .default))
//                .offset(y: 16)
            }
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
                    Group {
                        VStack {
                            Text("Easy")
                                .fontWeight(.light)
                                .foregroundColor(.black)
                                .font(.system(size: 20.0))
                        }
                    }
                    .frame(width: 80.0, height: 24.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(self.easySelected ? Color.pink : Color.white, lineWidth: 1)
                    )
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
                    Group {
                        VStack {
                            Text("Medium")
                                .fontWeight(.light)
                                .foregroundColor(.black)
                                .font(.system(size: 20.0))
                        }
                    }
                    .frame(width: 80.0, height: 24.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(self.medSelected ? Color.pink : Color.white, lineWidth: 1)
                    )
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
                    Group {
                        VStack {
                            Text("Hard")
                                .fontWeight(.light)
                                .foregroundColor(.black)
                                .font(.system(size: 20.0))
                        }
                    }
                    .frame(width: 80.0, height: 24.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(self.hardSelected ? Color.pink : Color.white, lineWidth: 1)
                    )
                }
                .padding()
            }
            
            Divider()
                .frame(maxWidth: 300)
            
            Text("What did you do...")
                .frame(maxWidth: 300)
                .font(.system(size: 16, weight: .heavy, design: .default))
            
            ScrollView(.horizontal) {
                HStack {
                    Button(action: {
                        self.hiit.toggle()
                    }) {
                        Text("HIIT")
                            .foregroundColor(self.hiit ? .pink : .black)
                    }
                    
                    Button(action: {
                        self.run.toggle()
                    }) {
                        Text("Running")
                            .foregroundColor(self.run ? .pink : .black)
                    }
                    
                    Button(action: {
                        self.yoga.toggle()
                    }) {
                        Text("Yoga")
                            .foregroundColor(self.yoga ? .pink : .black)
                    }
                    
                    Button(action: {
                        self.band.toggle()
                    }) {
                        Text("TheraBand")
                            .foregroundColor(self.band ? .pink : .black)
                    }
                    
                    Button(action: {
                        self.stretch.toggle()
                    }) {
                        Text("Stretching")
                            .foregroundColor(self.stretch ? .pink : .black)
                    }
                    
                    Button(action: {
                        self.cal.toggle()
                    }) {
                        Text("Calisthenics")
                            .foregroundColor(self.cal ? .pink : .black)
                    }
                    
                    Button(action: {
                        self.weight.toggle()
                    }) {
                        Text("Weight Training")
                            .foregroundColor(self.weight ? .pink : .black)
                    }
                    
                    Button(action: {
                        self.pilates.toggle()
                    }) {
                        Text("Pilates")
                            .foregroundColor(self.pilates ? .pink : .black)
                    }
                    
                    Button(action: {
                        self.zumba.toggle()
                    }) {
                        Text("Zumba")
                            .foregroundColor(self.zumba ? .pink : .black)
                    }
                }
            }
            .frame(width: 300, height: 40)
            
            Divider()
                .frame(maxWidth: 300)
            
            VStack {
                Text("Total Time Spent")
                .font(.system(size: 16, weight: .heavy, design: .default))
                MultiPicker(data: data, selection: $selection).frame(height: 300)
                    .frame(maxWidth: 300, maxHeight: 150)
            }
            
            Divider()
                .offset(y: 16)
            
            Spacer()
                .frame(height: 16)
            
            Button(action: {
                self.workout = ""
                self.easySelected = false
                self.medSelected = false
                self.hardSelected = false
                self.showCheck = false
                
                withAnimation {
                    self.showToast.toggle()
                }
                
                self.hiit = false
                self.run = false
                self.yoga = false
                self.band = false
                self.stretch = false
                self.cal = false // calisthenics
                self.weight = false
                self.pilates = false
                self.zumba = false
            }) {
                HStack {
                    Text("Enter Workout")
                        .font(.system(size: 24))
                    Image("check")
                        .resizable()
                        .frame(width: 28, height: 28)
                }
            }
            .opacity(self.showCheck ? 1 : 0)
            .offset(y: 16)
            
        }
        .toast(isShowing: $showToast, text: Text("Workout has been entered"))
    }
}

struct CorpsView_Previews: PreviewProvider {
    static var previews: some View {
        CorpsView()
    }
}
