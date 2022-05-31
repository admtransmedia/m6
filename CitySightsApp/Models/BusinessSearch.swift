//
//  BusinessSearch.swift
//  CitySightsApp
//
//  Created by Sergei Kriukov on 31.05.2022.
//

import Foundation
struct BusinessSearch: Decodable {
    var businesses = [Business]()
    var total = 0
    var region = Region()
    
}
struct Region:Decodable {
    var center = Coordinate()
}
