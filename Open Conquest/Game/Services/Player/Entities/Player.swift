//
//  Player.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/7/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class Player: Entity {
    var name: String
    var armies = [Army]()
    var cities = [City]()
    var resources = Resources(gold: 0)
    
    init(id: EntityID?, name: String) {
        self.name = name
        super.init(id: id)
    }
    
    func getName() -> String {
        return self.name
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func setResources(resources: Resources) {
        self.resources = resources
    }
    
    func addArmy(army: Army) {
        armies.append(army)
    }
    
    func addCity(city: City) {
        cities.append(city)
    }
}
