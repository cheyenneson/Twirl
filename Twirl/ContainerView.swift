//
//  ContainerView.swift
//  Twirl
//
//  Created by Cheyenne Son Davis on 4/19/20.
//  Copyright © 2020 Cheyenne Son Davis. All rights reserved.
//

import SwiftUI

struct ContainerView: View {
    var body: some View {
        VStack {
            TabView {
                InputView().tabItem({
                    Image("pen")
                    Text("Workout")
                }).tag(0)
                DataView().tabItem({
                    Image("graph")
                    Text("Data")
                }).tag(0)
                SettingsView().tabItem({
                    Image("wheel")
                    Text("Settings")
                }).tag(0)
            }

        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
