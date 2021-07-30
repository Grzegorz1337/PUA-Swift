//
//  main.swift
//  Producent i Konsument
//
//  Created by Kamil Grzeczkowski on 29/07/2021.
//


import Foundation

class Resources {
    private var res = 0
    
    func produceResources() -> Void {
        self.res += 1
    }
    
    func takeResources() -> Bool {
        if self.res > 0{
            self.res -= 1
            return true
        }
        else{
            return false
        }
    }
    
}

let cq = DispatchQueue(
    label: "communication",
    qos: .background,
    attributes: .concurrent,
    autoreleaseFrequency: .workItem
)
let dane = Resources()


for _ in 0...100{
    cq.async {
        // Producent dodaje
        dane.produceResources()
        print("Producer added some resources")
    }

    cq.async {
        // Konsument zabiera
        if(dane.takeResources()){
            print("Consument took some resources")
        }
    }
}


