//
//  Movie.swift
//  SampleWebAPI
//
//
//  Copyright © 2018 Digipolitan. All rights reserved.
//

import Foundation

public struct DetailMovie {
    var titre: String
    var description: String
    var poster: String
    var id: Int
    var release_date: String
    
    init(titre:String,description:String,poster:String,id:Int,release_date: String) {
        self.titre = titre
        self.description = description
        self.poster = "https://image.tmdb.org/t/p/w185/"+poster
        self.id = id
        self.release_date = release_date
        
    }
}
