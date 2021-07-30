//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Kamil Grzeczkowski on 30/07/2021.
//
import SwiftUI

struct ContentView: View {
        
    let cities: [City] = [
        City(id: 0, name: "Torun", displayName: "Toruń", country: "Polska", countryCode: "PL"),
        City(id: 1, name: "Warszawa", displayName: "Warszawa", country: "Polska", countryCode: "PL"),
        City(id: 2, name: "London", displayName: "Londyn", country: "Wielka Brytania", countryCode: "UK"),
        City(id: 3, name: "Berlin", displayName: "Berlin", country: "Niemcy", countryCode: "DE"),
        City(id: 4, name: "Tokio", displayName: "Tokio", country: "Japonia", countryCode: "JP"),
        City(id: 5, name: "Lisbon", displayName: "Lizbona", country: "Portugalia", countryCode: "PT"),
        City(id: 6, name: "Rio", displayName: "Rio", country: "Grecja", countryCode: "GR"),
        City(id: 7, name: "Denver", displayName: "Denwer", country: "Stany Zjednoczonw", countryCode: "US"),
        City(id: 8, name: "Nairobi", displayName: "Nairobi", country: "Kenia", countryCode: "KE"),
        City(id: 9, name: "Helsinki", displayName: "Helsinki", country: "Finlandia", countryCode: "FI"),
    ]
    
    var body: some View {
        VStack{
            NavigationView{
                List{
                    ForEach(cities, content: {city in
                        NavigationLink(destination: CityDetailsView(city: city)){
                            ListRow(city: city)
                            
                        }
                    })
                }.navigationBarTitle("Pogoda w miastach")
            }
        }
    }
}

struct ListRow: View{
    var city:City
    var body: some View{
        VStack{
            HStack{
                Image(systemName: "globe")
                Text("\(city.displayName), \(city.country)").bold()
            }
        }
    }
}

struct Header: View {
    var body: some View{
        HStack{
            Image(systemName: "globe")
                .font(.system(size: 32))
                .padding(.leading)
            Text("Weather App").font(.title).bold()
                .padding()
            Image(systemName: "globe")
                .font(.system(size: 32))
                .padding(.trailing)
        }.background(Color.gray).cornerRadius(30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
