//
//  Session.swift
//  SampleWebAPI
//
//  Created by Arthur BLANC on 16/02/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import Foundation


public struct Session {
    var session_id: String
    var account_id: Int
    
    init(account_id:Int,session_id:String) {
        self.account_id = account_id
        self.session_id = session_id
        
    }
}
