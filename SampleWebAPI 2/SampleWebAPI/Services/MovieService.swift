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
        }
    }
    
    public func getOneMovie(id:Int, completion: @escaping (DetailMovie) -> Void){
        SessionManager.default.request("https://api.themoviedb.org/3/movie/\(id)?api_key=c2a65c4ec5c2e0b8847caec950444862&language=fr-FR").responseJSON { (res) in
            print(res.result.value)
            let result = res.result.value as! [String: Any]
            let movies = DetailMovie(titre:result["original_title"] as! String,description:result["overview"] as! String,poster:result["poster_path"] as! String,id:result["id"] as! Int,release_date: result["release_date"] as! String)
            completion(movies)

        }
    }
    
    public func getBestMovies(completion: @escaping ([BestMovies]) -> Void) {
        Alamofire.request("https://api.themoviedb.org/3/movie/top_rated?api_key=c2a65c4ec5c2e0b8847caec950444862&language=fr-FR").responseJSON{ (res) in
            guard let result = res.value as? [String:Any],
                let resultat2 = result["results"] as? [[String:Any]] else {
                    return
                    
            }
            
           
            
            let movie = resultat2.compactMap({ (elem) -> BestMovies? in
                return BestMovies(json: elem)
            })
            completion(movie)
        }
    }
    
    public func addAsFavourite(id:Int,session: Session,completion: @escaping (Bool) -> Void){
 
        let session_id = session.session_id
        let account_id = session.account_id
        
        let param = [
            
            "media_type": "movie",
            "media_id": id,
            "favorite": true
            ] as [String : Any]
        Alamofire.request("https://api.themoviedb.org/3/account/\(account_id)/favorite?api_key=c2a65c4ec5c2e0b8847caec950444862&session_id=\(session_id)",method: .post, parameters: param, encoding: JSONEncoding.default).responseJSON{ (res) in
            let result = res.result.value as! [String: Any]
            print(result["status_code"])
            let code = result["status_code"] as! Int
            completion(code == 1 || code == 12)
        }
    
        
    }

    
    public func search(text:String,completion: @escaping ([Movie]) -> Void){
        
        Alamofire.request("https:api.themoviedb.org/3/search/movie?api_key=c2a65c4ec5c2e0b8847caec950444862&language=en-US&query=\(text)&page=1&include_adult=false").responseJSON{ (res) in
            print("je suis la  \(res)")
            guard let result = res.value as? [String:Any],
                let resultat2 = result["results"] as? [[String:Any]] else{
                    print("je suis la aussi")
                  return
                }
                  let movie = resultat2.compactMap({ (elem) -> Movie? in
                return Movie(json: elem)
            })
            completion(movie)
            }

    public func getFav(session:Session,completion: @escaping ([Movie]) -> Void) {
        let account_id = session.account_id
        let session_id = session.session_id
        Alamofire.request("https://api.themoviedb.org/3/account/\(account_id)/favorite/movies?api_key=c2a65c4ec5c2e0b8847caec950444862&session_id=\(session_id)&language=fr-FR&sort_by=created_at.asc&page=1").responseJSON{ (res) in
            guard let result = res.value as? [String:Any],
                let resultat2 = result["results"] as? [[String:Any]] else {

                    return
                    
            }
            let movie = resultat2.compactMap({ (elem) -> Movie? in
                return Movie(json: elem)
            })
            completion(movie)
        }

    }
}

