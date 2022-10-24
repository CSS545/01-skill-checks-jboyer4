//
//  ContentView.swift
//  HW2
//
//  Created by Justin Boyer on 10/22/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var settings = ViewModel()
    var body: some View {
        VStack {
            CircleImage(settings: settings)
            UserSettings(settings: settings)
        }
        Spacer()

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }}

