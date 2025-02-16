//
//  ViewController.swift
//  SampleOne
//
//  Created by naresh chouhan on 2/16/25.
//

import UIKit

class ViewController: UIViewController,WeatherViewProtocol {
    private var presenter: WeatherPresenterProtocol?
    @IBOutlet weak var cityName : UILabel!
    @IBOutlet weak var cityTemp : UILabel!
    @IBOutlet weak var getWeatherButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = WeatherPresenter(view: self)
        cityName.text = "New York"
        
    }
    @IBAction func getWather(_ sender: Any) {
        guard let city = cityName.text, !city.isEmpty else  {
            showError(message: "Error")
            return
        }
        presenter?.getWeather(for: city)
        
    }
    
 
    func showWeather(city: String, temperature: String) {
        DispatchQueue.main.async {
            self.cityName.text = city
            self.cityTemp.text = temperature
        }
    }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            self.cityTemp.text = message
        }
    }

}

