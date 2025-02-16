//
//  WeatherPresenter.swift
//  SampleOne
//
//  Created by naresh chouhan on 2/16/25.
//

import Foundation


protocol WeatherViewProtocol: AnyObject {
    func showWeather(city: String, temperature: String)
    func showError(message: String)
}

protocol WeatherPresenterProtocol {
    func getWeather(for city: String)
}

class WeatherPresenter : WeatherPresenterProtocol{
    
    weak var view : WeatherViewProtocol?
    let weatherService :  APIServiceProtocol
    init(view: WeatherViewProtocol, weatherService: APIServiceProtocol = APIService()) {
        self.view = view
        self.weatherService = weatherService
    }
    
    func getWeather(for city: String) {
        weatherService.fetchWeather(for: city) { [weak self] weather in
            
            guard let self = self else { return }
            
            if let weather = weather {
                let temp = "\(weather.main.temp)°C"
                self.view?.showWeather(city: weather.name, temperature: temp)
            } else {
                self.view?.showError(message: "Failed to fetch weather.")

            }
        }
    }
}
