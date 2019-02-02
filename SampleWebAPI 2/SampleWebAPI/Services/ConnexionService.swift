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
        print("getMovies")
        SessionManager.default.request("https://api.themoviedb.org/3/authentication/token/new?api_key=c2a65c4ec5c2e0b8847caec950444862").responseJSON { (res) in
            let z = res.result.value as! [String: Any]
            
            let movies = Connexion(token:z["request_token"]! as! String,expire_at:z["expires_at"]! as! String,success: z["success"]! as! Bool)
            completion(movies)
    }
    
    /* guard let url = URL(string: "https://moc-3a-movies.herokuapp.com/") else {
     return
     }
     let task = URLSession.shared.dataTask(with: url) { (data, res, err) in
     guard let d = data,
     let json = try? JSONSerialization.jsonObject(with: d, options: .allowFragments),
     let m = json as? [[String: Any]] else {
     return
     }
     //let movies = m.compactMap { return Movie(json: $0) } // flatMap
     let movies = m.compactMap({ (elem) -> Movie? in
     return Movie(json: elem)
     })
     completion(movies)
     }
     task.resume()*/
}
    public func connect(token:String, username:String, pwd:String, completion:@escaping (Bool) -> Bool) {
        print("connect")
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
            guard let success = result["success"] as? Int else{
                return
            }
            
            completion(success == 1)
        }
        
        
        }
    }

