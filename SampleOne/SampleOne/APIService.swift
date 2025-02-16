//
//  APIService.swift
//  SampleOne
//
//  Created by naresh chouhan on 2/16/25.
//

import Foundation

class APIService:APIServiceProtocol {
    private let apiKey = "0dc9d69763e7457cc498e1f2501a6076"
    func fetchWeather(for city: String, completion: @escaping (WeatherResponse?) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
               
               guard let url = URL(string: urlString) else {
                   completion(nil)
                   return
               }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data =  data, error == nil  else {
                completion(nil)
                return
            }
            
            do {
                          let weatherData = try JSONDecoder().decode(WeatherResponse.self, from: data)
                          DispatchQueue.main.async {
                              completion(weatherData)
                          }
                      } catch {
                          completion(nil)
                      }
            
        }.resume()
    }
}
                                        
                                        
protocol APIServiceProtocol {
    func fetchWeather(for city: String, completion: @escaping (WeatherResponse?) -> Void)

}
