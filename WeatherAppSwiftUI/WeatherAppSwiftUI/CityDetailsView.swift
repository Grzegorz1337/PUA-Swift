//
//  CityDetailsView.swift
//  WeatherAppSwiftUI
//
//  Created by Kamil Grzeczkowski on 30/07/2021.
//

import SwiftUI

struct CityDetailsView: View {
    @State var city:City
    
    var body: some View {
        Text("Welcome \(city.displayName)")
    }
}

struct CityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailsView(city: City(id: 0, name: "Torun", displayName: "Toruń", country: "Polska", countryCode: "PL"))
    }
}
