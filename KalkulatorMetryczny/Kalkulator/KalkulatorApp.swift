//
//  KalkulatorApp.swift
//  Kalkulator
//
//  Created by Kamil Grzeczkowski on 29/07/2021.
//

import SwiftUI

@main
struct KalkulatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(inputLengthPick: 0, outputLengthPick: 0, lengthInput: "0", lengthOutput: "0")
        }
    }
}
