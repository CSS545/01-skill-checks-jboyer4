//
//  CircleImage.swift
//  landmarks
//
//  Created by Justin Boyer on 10/22/22.
//

import SwiftUI

struct CircleImage: View {
    @StateObject var settings: ViewModel
    var body: some View {
        Image(settings.isOn ? "espresso":"AdobeStock_151199591-Coffee-Beans")
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(settings: ViewModel())    }
}
