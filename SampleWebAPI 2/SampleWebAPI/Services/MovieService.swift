//
//  MovieService.swift
//  SampleWebAPI
//
//  Created by Arthur BLANC on 05/02/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import Alamofire


public class MovieService {
    
    public static let `default` = MovieService()
    private init( ){
    }
    
    public func getOneMovie(completion: @escaping (DetailMovie) -> Void){
        SessionManager.default.request("https://api.themoviedb.org/3/movie/550?api_key=c2a65c4ec5c2e0b8847caec950444862&language=en-US").responseJSON { (res) in
            print(res.result.value)
            let result = res.result.value as! [String: Any]
            
            let movies = DetailMovie(titre:result["original_title"] as! String,description:result["overview"] as! String,poster:result["poster_path"] as! String,id:result["id"] as! Int,release_date: result["release_date"] as! String )
            completion(movies)
        }
    }
}
