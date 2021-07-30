//
//  ContentView.swift
//  Kalkulator
//
//  Created by Kamil Grzeczkowski on 29/07/2021.
//

import SwiftUI

struct ContentView: View {
    let length = [
        "milimetry",
        "centymetry",
        "cale",
        "decymetry",
        "stopy",
        "metry",
        "kilometry",
        "mile"
    ]
    let calc: [Double] = [
        1,
        10.0,
        25.4,
        100,
        304.8,
        1000,
        1000000,
        1609344
    ]
    @State var inputLengthPick: Int
    @State var outputLengthPick: Int
    @State var lengthInput: String
    @State var lengthOutput: String
    
    
    
    var body: some View {
        VStack()
        {
            HStack(){
                Image(systemName: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right").font(.system(size: 24))
                    .padding(5.0)
                    .background(Color.blue)
                    .cornerRadius(25.0)
                Text("Kalkulator jednostek odległości")
                    .multilineTextAlignment(.center)
                    .padding(.all, 6.0)
                    .background(Color.white)
                    .font(.title)
                    .cornerRadius(24)
                Image(systemName: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right").font(.system(size: 24))
                    .padding(5.0)
                    .background(Color.blue)
                    .cornerRadius(25.0)
            }.padding(.vertical).background(Color.blue).cornerRadius(24)
            
            Text("Konwertuj z ")
            Picker("Konwertuj z: ", selection: $inputLengthPick, content: {
                ForEach( 0 ..< length.count, content: {
                    Text("\(length[$0])")
                })
                })
            
            Text("Konwertuj na ")
            Picker("Konwertuj na: ", selection: $outputLengthPick, content: {
                ForEach( 0 ..< length.count, content: {
                    Text("\(length[$0])")
                })
                })
            HStack{
                TextField("Input", text: $lengthInput).padding()
                Image(systemName: "chevron.right.square")
                    .font(.system(size: 21))
                
                Text("\((Double(lengthInput) ?? 0) * calc[inputLengthPick] / calc[outputLengthPick])")
                    .padding()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(inputLengthPick: 0, outputLengthPick: 0, lengthInput: "0", lengthOutput: "0")
    }
}
