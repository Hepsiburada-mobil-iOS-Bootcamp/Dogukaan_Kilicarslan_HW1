//
//  TownStruct.swift
//  iOS_Week_1
//
//  Created by DarkBringer on 22.09.2021.
//

import Foundation

struct TownStruct: TownProtocol {
    func showResources() {
        print("they have \(String(describing: resources["Grain"] ?? 0)) kgs of grain to eat and \(String(describing: resources["Guns"] ?? 0)) guns to defend themselves.")
    }
    
    func listCitizens() {
        print("The town \(name) has \(citizens.count) people in it and they are \(citizens)")
    }
    
    
    let name: String
    var citizens: [String]
    var resources: [String: Int]
    
    init(name: String, citizens: [String], resources: [String: Int]) {
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }
    
    func fortify() {
        print("Defences increased!")
    }
    
}

//MARK: - At this point I went with the Dungeon Crawler but still wanted to include Towns Folder in place.


//var myTown = TownStruct(name: "Dodoistan", citizens: ["Dogukaan", "Finn the Human", "Jake the Dog", "John Wick", "Temel"], resources: ["Grain" : 100, "Ore" : 42, "Guns" : 75, "Hamsi" : 15, "Pancakes" : 18])
//
//var anotherTown = TownStruct(name: "No Mans Land", citizens: ["ThumbleWeed", "ThumbleWeed", "ThumbleWeed"], resources: ["Grain": 0, "Pancakes": 0])

//myTown.listCitizens()
//myTown.showResources()
//
//print("The town \(anotherTown.name) has \(anotherTown.citizens.count) people in it and they are all \(anotherTown.citizens[0])s. Also they have \(String(describing: anotherTown.resources["Grain"]!)) kgs of grain to eat and \(String(describing: anotherTown.resources["Pancakes"]!)) pancakes to make breakfast for themselves. ")
