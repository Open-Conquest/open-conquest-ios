//
//  GetCitiesResponse.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/17/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class GetCitiesResponse: Response {
    
    var cities: [City] = [City]()
    
    init(response: Response) {
        let cityData = response.getData()
        for city in cityData.array! {
            let thisCity = City(json: city)
            cities.append(thisCity)
        }
        
        super.init(service: APIServices(rawValue: response.getService().rawValue)!, operation: APIOperations(rawValue: response.getOperation().rawValue)!, data: response.getData())
    }
    
    func getCities() -> [City] {
        return [City]()
    }
    
}
