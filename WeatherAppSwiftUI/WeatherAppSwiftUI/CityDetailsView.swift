//
//  CityDetailsView.swift
//  WeatherAppSwiftUI
//
//  Created by Kamil Grzeczkowski on 30/07/2021.
//

import SwiftUI

struct CityDetailsView: View {
    @ObservedObject var weatherData: WeatherAPIController
    
    init(city:City) {
        self.weatherData = WeatherAPIController(city: city)
    }
    
    var icons:WeatherIcons = WeatherIcons()
    
    var body: some View {
        VStack{
            Image(systemName: "\(icons.getIcon[weatherData.weather] ?? "questionmark.circle")")
                .font(.system(size: 70))
                .padding()
            Text("\(weatherData.city.displayName), \(weatherData.city.country)").padding()
            HStack{
                Text("Temperatura: ")
                    .padding()
                Spacer()
                Text("\(weatherData.temperature)°C")
                    .padding()
            }
            HStack{
                Text("Wilgotność: ")
                    .padding()
                Spacer()
                Text("\(weatherData.humidity)%")
                    .padding()
            }
            HStack{
                Text("Ciśnienie: ")
                    .padding()
                Spacer()
                Text("\(weatherData.pressure)hPa")
                    .padding()
            }
            
            Spacer()
        }
    }
}

struct CityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailsView(city: City(id: 0, name: "Torun", displayName: "Toruń", country: "Polska", countryCode: "PL"))
    }
}
