//
//  Location.swift
//  swiftfulMapApp
//
//  Created by mustafa eray Pişkin on 19.02.2024.
//

import Foundation
import MapKit

struct Location : Identifiable, Equatable {

    let name : String
    let cityName : String
    let coordinates : CLLocationCoordinate2D
    let description : String
    let imageNames : [String]
    let link : String
    
    var id : String {
        name + cityName
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
