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
    var id: String
    
    init(token:String,expire_at:String,success:Bool) {
        self.token = token
        self.expire_at = expire_at
        self.success = success
        
    }
}
