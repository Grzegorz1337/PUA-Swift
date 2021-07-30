import AppKit

var args = CommandLine.arguments

/*
 args:
 1 - City name
 2 - Postal code
 3 - Country code
 4 - Desired parameter = [temperature, humidity, pressure, wind] or empty
 
 Example run command:
    swift main.swift Plock 09-400 PL temperature
 */


var str = "http://api.openweathermap.org/data/2.5/weather?q="+args[1]+","+args[2]+","+args[3]+"&appid=4e215b9b9b6642cff1cd9e4f16909da6"
struct Coords:Codable
{
    let lon:Double
    let lat:Double
}
struct Weather:Codable {
    let id:Int
    let main:String
    let description:String
    let icon:String
}
struct Wind:Codable
{
    let speed:Double
    let deg:Int
}

struct Cloud:Codable
{
    let all:Int
}

struct Sys: Codable
{
    let type:Int
    let id:Int
    let country:String
    let sunrise:Int
    let sunset:Int
}
struct Data: Codable
{
    let temp:Double
    let feels_like:Double
    let temp_min:Double
    let temp_max:Double
    let pressure: Int
    let humidity: Int
}

struct Response: Codable
{
    let coord:Coords
    let weather:[Weather]
    let base:String
    let main:Data
    let visibility:Int
    let wind: Wind
    let clouds:Cloud
    let dt:Int
    let sys:Sys
    let timezone:Int
    let id:Int
    let name:String
    let cod:Int
}

let group = DispatchGroup()
group.enter()

let url = URL(string: str)!

let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
    if let data = data{
        if let decodedData = try? JSONDecoder().decode(Response.self, from: data) {
            switch args[4] {
            case "temperature":
                print("temperature: ", decodedData.main.temp)
            case "humidity":
                print("humidity: ", decodedData.main.humidity)
            case "pressure":
                print("pressure: ", decodedData.main.pressure)
            case "wind":
                print("wind: ", decodedData.wind)
            default:
                print(decodedData)
            }
            group.leave()
        }
    }
    if let error = error{
        print(error)
    }
})

task.resume()
group.wait()
