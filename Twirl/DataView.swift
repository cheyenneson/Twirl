//
//  DataView.swift
//  Twirl
//
//  Created by Cheyenne Son Davis on 4/19/20.
//  Copyright © 2020 Cheyenne Son Davis. All rights reserved.
//

import SwiftUI
import Charts

struct DataView: View {
    @State var showFeetData = false
    @State var showExtData = false
    @State var showCorpsData = false
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    VStack {
                        Text("Extensions work over the past 3 weeks")
                            .padding()
                        Chart(data: [1, 0.90, 0.4, 0, 0.92, 0, 0.4, 0.2, 0.6, 0, 0.2, 0.1, 0.6, 0.9, 0.2, 0.9, 0.3, 0.3, 0.2, 0.10, 1])
                            .chartStyle(
                                ColumnChartStyle(column: Capsule().foregroundColor(.pink), spacing: 2)
                            )
                            .frame(width: 250)
                        Spacer()
                    }
                    
                    VStack {
                        Text("Feet work over the past 3 weeks")
                            .padding()
                        Chart(data: [0.5, 0.2, 0.1, 0.6, 0.1, 0.20, 0.9, 1, 0.3, 0.2, 0.10, 0.1, 1, 0.9, 0, 0.2, 0, 0.4, 0.2, 0.6])
                            .chartStyle(
                                ColumnChartStyle(column: Capsule().foregroundColor(.pink), spacing: 2)
                            )
                            .frame(width: 250)
                        Spacer()
                    }

                    VStack {
                        Text("Port de Corps work over the past 3 weeks")
                            .padding()
                        Chart(data: [0.1, 0.10, 0.4, 0, 0.2, 0, 0, 0.2, 0.2, 0, 0.2, 1, 0.8, 0.1, 0.20, 0.9, 0.9, 0.4, 0.2, 0.1])
                            .chartStyle(
                                ColumnChartStyle(column: Capsule().foregroundColor(.pink), spacing: 2)
                            )
                            .frame(width: 250)
                        Spacer()
                    }
                }
            }
            .frame(height: 352)
            
            VStack {
                HStack {
                    Image("extensions")
                        .resizable()
                        .frame(width: 20.0, height: 36.0)
                    Text("Total time: 12 hours, 22 minutes, and 19 seconds")
                }
                
                HStack {
                    Image("feet")
                        .resizable()
                        .frame(width: 42.0, height: 36.0)
                    Text("Total time: 19 hours, 2 minutes, and 46 seconds")
                }
                
                HStack {
                    Image("portdecorps")
                        .resizable()
                        .frame(width: 24.0, height: 36.0)
                    Text("Total time: 8 hours, 46 minutes, and 1 second")
                }
            }
            .frame(width: 250, height: 250)
            
            Spacer()
        }
        
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
