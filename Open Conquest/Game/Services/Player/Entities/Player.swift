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
    var resources = Resources(gold: 0)
    var armies = [Army]()
    var city: City?
    
    init(id: EntityID?, name: String) {
        self.name = name
        super.init(id: id)
    }
    
    func addArmy(army: Army) {
        armies.append(army)
    }
    
    // MARK: GETTERS & SETTERS
    
    func getName() -> String {
        return self.name
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func getResources() -> Resources {
        return resources
    }
    
    func getArmies() -> [Army] {
        return armies
    }
    
    func getCity() -> City? {
        return city
    }
    
    func setResources(resources: Resources) {
        self.resources = resources
    }
    
    func setArmies(armies: [Army]) {
        self.armies = armies
    }
    
    func setCity(city: City) {
        self.city = city
    }
}
