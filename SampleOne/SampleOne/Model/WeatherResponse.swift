//
//  WeatherResponse.swift
//  SampleOne
//
//  Created by naresh chouhan on 2/16/25.
//

import Foundation


struct WeatherResponse : Codable {
    let name : String
    let main : WeatherMain
}



struct WeatherMain: Codable {
    let temp: Double

}
