//
//  ContentView.swift
//  Twirl
//
//  Created by Cheyenne Son Davis on 4/2/20.
//  Copyright © 2020 Cheyenne Son Davis. All rights reserved.
//

import SwiftUI

// This is not the best way to do this, change later
func showNext(ext: Bool, turnout: Bool, feet: Bool, leaps: Bool, corps: Bool) -> Bool {
    var count = 0
    if(ext == true) {
        count += 1
    }
    if(turnout == true) {
        count += 1
    }
    if(feet == true) {
        count += 1
    }
    if(leaps == true) {
        count += 1
    }
    if(corps == true) {
        count += 1
    }
    
    if(count == 3) {
        return true
    }
    else {
        return false
    }
}

struct NavLogo: View {
    var body: some View {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 99.0, height: 63.0)
                    .padding()
            }
            .frame(width: 828) // width of iphone 11, to center
            .background(Color.clear)
    }
}

struct ContentView: View {
    @State var extentionsSelected = false
    @State var turnoutSelected = false
    @State var feetSelected = false
    @State var leapsSelected = false
    @State var corpsSelected = false

    var body: some View { //can only return 1 view!
        NavigationView {
            VStack {
                OpeningView()
                    .navigationBarItems(
                        leading: NavLogo()
                    )

                NavigationLink(destination: ContainerView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(
                        leading: NavLogo()
                    )) {
                    HStack {
                        Text("Next")
                            .font(.title)
                        Image("arrow")
                            .resizable()
                            .frame(width: 24, height: 32)
                    }
                }
                    .offset(x: 124)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
