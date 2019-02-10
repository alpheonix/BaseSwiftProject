//
//  MovieService.swift

//  HomePage
//
//  Created by Maxime ISTIN on 16/01/2019.
//  Copyright © 2019 Maxime ISTIN. All rights reserved.

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
     public func getMovies(completion: @escaping ([Movie]) -> Void) {
        Alamofire.request("https://api.themoviedb.org/3/movie/now_playing?api_key=c2a65c4ec5c2e0b8847caec950444862&language=fr-FR").responseJSON{ (res) in
            guard let result = res.value as? [String:Any],
                  let resultat2 = result["results"] as? [[String:Any]] else {
                    return
                    
            }


            let movie = resultat2.compactMap({ (elem) -> Movie? in
               return Movie(json: elem)
            })
           completion(movie)
    
    public func getOneMovie(completion: @escaping (DetailMovie) -> Void){
        SessionManager.default.request("https://api.themoviedb.org/3/movie/550?api_key=c2a65c4ec5c2e0b8847caec950444862&language=fr-FR").responseJSON { (res) in
            print(res.result.value)
            let result = res.result.value as! [String: Any]
            
            let movies = DetailMovie(titre:result["original_title"] as! String,description:result["overview"] as! String,poster:result["poster_path"] as! String,id:result["id"] as! Int,release_date: result["release_date"] as! String )
            completion(movies)

        }
    }
}
