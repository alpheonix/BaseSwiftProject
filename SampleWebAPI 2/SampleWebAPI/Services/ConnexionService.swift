//
//  File.swift
//  SampleWebAPI
//
//  Created by Arthur BLANC on 08/01/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import Alamofire

public class ConnexionService {
    
    public static let `default` = ConnexionService()
    private init( ){
        
    }
    public func getToken(completion: @escaping (Connexion) -> Void) {
        
        SessionManager.default.request("https://api.themoviedb.org/3/authentication/token/new?api_key=c2a65c4ec5c2e0b8847caec950444862").responseJSON { (res) in
            let z = res.result.value as! [String: Any]
            
            let movies = Connexion(token:z["request_token"]! as! String,expire_at:z["expires_at"]! as! String,success: z["success"]! as! Bool)
            completion(movies)
    }
}
public func connect(token:String, username:String, pwd:String, completion:@escaping (Session) -> Session ) {
        
        let baseUrl = "https://api.themoviedb.org/3/authentication/token/validate_with_login"
        let queryStringParam  =  [
            "api_key":"c2a65c4ec5c2e0b8847caec950444862",
        ]
        //Make first url from this queryStringParam using URLComponents
        var urlComponent = URLComponents(string: baseUrl)!
        let queryItems = queryStringParam.map  { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponent.queryItems = queryItems
        
        //Now make `URLRequest` and set body and headers with it
        let param = [
            
                "username": username,
                "password": pwd,
                "request_token": token
            ]
        let headers = [ "Content-Type": "application/json" ]
        var request = URLRequest(url: urlComponent.url!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: param)
        request.allHTTPHeaderFields = headers
        
        //Now use this URLRequest with Alamofire to make request
        Alamofire.request(request).responseJSON { response in
            let result = response.result.value  as! [String: Any]
            print ("success")
            print(result["success"])
            if(result["success"] != nil ){
                print ("enter")
                let sessionParam = [
                    "request_token": token
                ]
                
                Alamofire.request("https://api.themoviedb.org/3/authentication/session/new?api_key=c2a65c4ec5c2e0b8847caec950444862",method: .post, parameters: sessionParam, encoding: JSONEncoding.default).responseJSON{ (res) in
                    let result = res.result.value as! [String: Any]
                    //print(result["success"])
                    //print(result["status_message"]as! String)
                    //print(result["status_code"])
                    //                print("session")
                    //                print(result["session_id"])
                    let session_id = result["session_id"] as! String
                    Alamofire.request("https://api.themoviedb.org/3/account?api_key=c2a65c4ec5c2e0b8847caec950444862&session_id=\(session_id)").responseJSON{ (response) in
                        let account = response.result.value  as! [String: Any]
                        print("id")
                        let account_id = account["id"] as! Int
                        let sessions = Session(account_id: account_id, session_id: session_id)
                        
                        completion(sessions)
                    }
                    
                    
                }
            }else{
                let sessions = Session(account_id: 0, session_id: "0")
                
                completion(sessions)
            }
            
            
        }
        
        }
    public func disconect(session_id:String, completion:@escaping (Bool) -> Bool){
        let param = [
            
            "session_id": session_id
        ]
        print(session_id)
        Alamofire.request("https://api.themoviedb.org/3/authentication/session?api_key=c2a65c4ec5c2e0b8847caec950444862", method: .delete, parameters: param).responseJSON { (response) in
            print(response)
            let success = response.result.value as! [String: Any]
            print(success["success"] as! Bool)
            completion(success["success"] as! Bool)
        }
        
        
    }
    }

