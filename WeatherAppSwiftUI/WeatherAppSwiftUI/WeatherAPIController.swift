//
//  WeatherAPIController.swift
//  WeatherAppSwiftUI
//
//  Created by Kamil Grzeczkowski on 30/07/2021.
//

import Foundation

class WeatherAPIController: ObservableObject{
    @Published var weather = "none"
    @Published var temperature:Double = 23
    @Published var humidity = 50
    @Published var pressure = 1000
    @Published var city: City
    init(city:City) {
        self.city = city
        self.getAPIData()
    }
    
    func getAPIData(){
        let address = "http://api.openweathermap.org/data/2.5/weather?q=\(city.name),\(city.countryCode)&appid=4e215b9b9b6642cff1cd9e4f16909da6"
        if let url = URL(string:address){
            let data = try! Data(contentsOf: url)
            let jsonDc = JSONDecoder()
            let response = try! jsonDc.decode(Response.self, from: data)
            self.weather = response.weather?.first?.main ?? "none"
            self.temperature = (response.main?.temp ?? -726.85) - 272.15
            self.humidity = response.main?.humidity ?? -1
            self.pressure = response.main?.pressure ?? 0
        }
    }
}

struct Main:Codable{
    var temp:Double?
    var pressure:Int?
    var humidity:Int?
}

struct Weather:Codable{
    var main:String
}

struct Response:Codable{
    var weather: [Weather]?
    var main: Main?
}
