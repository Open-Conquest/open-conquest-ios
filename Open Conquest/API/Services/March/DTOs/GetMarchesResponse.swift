//
//  GetMarchesResponse.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/18/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class GetMarchesResponse: Response {
    
    var marches: [March]
    
    init(response: Response) {
        marches = [March]()
        
        let marchesData = response.getData()
        for march in marchesData.array! {
            let thisMarch = March(json: march)
            marches.append(thisMarch)
        }
        
        super.init(service: APIServices(rawValue: response.getService().rawValue)!, operation: APIOperations(rawValue: response.getOperation().rawValue)!, data: response.getData())
    }
    
    func getMarches() -> [March] {
        return marches
    }
        
}
