//
//  CampusData.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/6/20.
//

import Foundation
import CoreLocation

struct Building: Codable {
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    let name: String
    let opp_bldg_code: Int
    let year_constructed: Int
    
    enum CodingKeys : String, CodingKey {
        case latitude
        case longitude
        case name
        case opp_bldg_code = "buildingCode"
        case year_constructed = "yearConstructed"
    }
}

class CampusData: ObservableObject {
    var allBuildings : [Building]
    var destinationURL: URL {
        didSet {
            saveData()
        }
    }
    
    init() {
        let filename = "buildings"
        let mainBundle = Bundle.main
        let bundleURL = mainBundle.url(forResource: filename, withExtension: "json")!
        
        let fileManager =  FileManager.default
        let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        destinationURL = documentURL.appendingPathComponent(filename + ".json")
        let fileExists = fileManager.fileExists(atPath: destinationURL.path)
        
        do {
            let url = fileExists ? destinationURL : bundleURL
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            allBuildings = try decoder.decode([Building].self, from: data)
        } catch {
            print("Error Info: \(error)")
            allBuildings = []
        }
    }
    
    func saveData() {
        let encoder = JSONEncoder()
        do {
            let data  = try encoder.encode(allBuildings)
            try data.write(to: self.destinationURL)
        } catch  {
            print("Error writing: \(error)")
        }
    }
}

