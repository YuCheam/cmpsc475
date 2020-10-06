//
//  CampusData.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/6/20.
//

import Foundation
import MapKit

struct Building: Codable {
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    let name: String
    let buildingCode: Int
    let yearConstructed: Int?
    let photo: String?
    var favorited: Bool
    
    private enum CodingKeys : String, CodingKey {
        case latitude
        case longitude
        case name
        case buildingCode = "opp_bldg_code"
        case yearConstructed = "year_constructed"
        case photo
        case favorited
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.latitude = try container.decodeIfPresent(CLLocationDegrees.self, forKey: .latitude)!
        self.longitude = try container.decodeIfPresent(CLLocationDegrees.self, forKey: .longitude)!
        self.name = try container.decodeIfPresent(String.self, forKey: .name)!
        self.buildingCode = try container.decodeIfPresent(Int.self, forKey: .buildingCode)!
        self.yearConstructed = try container.decodeIfPresent(Int.self, forKey: .yearConstructed)
        self.photo = try container.decodeIfPresent(String.self, forKey: .photo)
        self.favorited = try container.decodeIfPresent(Bool.self, forKey: .favorited) ?? false
    }
}

class LocationsManager: ObservableObject {
    @Published var allBuildings : [Building]
    var destinationURL: URL {
        didSet {
            saveData()
        }
    }
    
    @Published var region = MKCoordinateRegion(center: CampusData.initialCoordinate, span: MKCoordinateSpan(latitudeDelta: CampusData.span, longitudeDelta: CampusData.span))
    
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

