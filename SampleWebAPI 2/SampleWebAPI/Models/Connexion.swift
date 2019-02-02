//
//  Movie.swift
//  SampleWebAPI
//
//  Created by Benoit BRIATTE on 10/12/2018.
//  Copyright © 2018 Digipolitan. All rights reserved.
//

import Foundation

public struct Connexion {
    var success: Bool
    var expire_at: String
    var token: String
    
    init(token:String,expire_at:String,success:Bool) {
        self.token = token
        self.expire_at = expire_at
        self.success = success

}
}
