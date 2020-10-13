//
//  CampusData.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/6/20.
//

import Foundation
import MapKit

struct Building: Codable, Identifiable, Hashable {
    let id = UUID()
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


class LocationsManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var allBuildings : [Building]
    @Published var plottedBuildings: [Building] = []
    
    let initialCoordinate = CLLocationCoordinate2D(latitude: 40.800448, longitude: -77.861278)
    let span: CLLocationDegrees = 0.01
    @Published var region : MKCoordinateRegion
    @Published var route : MKRoute?
    
    let locationManager: CLLocationManager
    var showUserLocation: Bool = true
    
    var destinationURL: URL {
        didSet {
            saveData()
        }
    }
    
    
    
    override init() {
        region = MKCoordinateRegion(center: initialCoordinate, span: MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span))
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
        locationManager = CLLocationManager()
        super.init()
        
        allBuildings.sort { (b1, b2) -> Bool in
            return b1.name < b2.name
        }
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    //MARK: CLLocationManager Delegate
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            showUserLocation = true
        default:
            locationManager.stopUpdatingLocation()
            showUserLocation = false
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.map({$0.coordinate})
        if let coordinate = newLocation.first {
            region.center = coordinate
        }
    }
    
    //MARK: Directions
    func getDirections(from: Building?, to: Building?) -> MKRoute? {
        let request = MKDirections.Request()
        
        if from == nil {
            request.source = MKMapItem.forCurrentLocation()
        } else if to == nil {
            request.destination = MKMapItem.forCurrentLocation()
        } else {
            let sourceCoordinate = CLLocationCoordinate2D(latitude: from!.latitude, longitude: from!.longitude)
            let destinationCoordinate = CLLocationCoordinate2D(latitude: to!.latitude, longitude: to!.longitude)
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceCoordinate))
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate))
        }
        
        request.transportType = .walking
        request.requestsAlternateRoutes = true
        
        let directions = MKDirections(request: request)
        directions.calculate(completionHandler: { (response, error) in
            guard (error == nil) else {print(error!.localizedDescription); return}
            if let route = response?.routes.first {
                self.route = route
            }
        })
        
        return route
    }
    
    //MARK: Map Functions
    func centerToPlot(for building: Building) {
        let buildingCoordinate = CLLocationCoordinate2D(latitude: building.latitude, longitude: building.longitude)
        region.center = buildingCoordinate
        region.span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
    }
    
    func resetMap() {
        if let coordinate = locationManager.location?.coordinate {
            region.center = coordinate
        } else { region.center = initialCoordinate }
        region.span = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
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

