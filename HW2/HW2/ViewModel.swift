//
//  ViewModel.swift
//  HW2
//
//  Created by Justin Boyer on 10/23/22.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var isOn: Bool = UserDefaults.standard.bool(forKey: "isOn"){
        didSet{
            UserDefaults.standard.set(self.isOn, forKey: "isOn")
        }
    }
}
