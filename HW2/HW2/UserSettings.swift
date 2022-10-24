//
//  UserSettings.swift
//  HW2
//
//  Created by Justin Boyer on 10/23/22.
//

import SwiftUI

struct UserSettings: View {
    @StateObject var settings: ViewModel
    var body: some View {
        VStack {
            Toggle("Brew", isOn: $settings.isOn)
        }
        .padding(.horizontal)
    }
}

struct UserSettings_Previews: PreviewProvider {
    static var previews: some View {
        UserSettings(settings: ViewModel())
    }
}
