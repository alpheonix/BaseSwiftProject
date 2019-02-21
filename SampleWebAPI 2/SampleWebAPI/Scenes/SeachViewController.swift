//
//  SeachViewController.swift
//  SampleWebAPI
//
//  Created by oualiken ourdia on 21/02/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import UIKit
import Alamofire

class SeachViewController: UISearchContainerViewController {

    @IBOutlet var seachBar: UISearchBar!
    @IBOutlet var SeachTableView: UITableView!
    var movies: [Movie]!
    
    class func newInstance() -> SeachViewController{
        let mlvc = SeachViewController()
        return mlvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print("sech \(searchText)")
//        Alamofire.request("https://api.themoviedb.org/3/search/movie?api_key=c2a65c4ec5c2e0b8847caec950444862&language=en-US&query=\(searchText)&page=1&include_adult=false").responseJSON{ (res) in
//            // print("je suis la  \(res)")
//            guard let result = res.value as? [String:Any],
//                let resultat2 = result["results"] as? [[String:Any]] else{return}
//
//            let movie = resultat2.compactMap({ (elem) -> Movie? in
//                return Movie(json: elem)
//            })
//            self.movies.append(movie[0])
//            print("laaaa \(movie)")
//            self.SeachTableView.reloadData()
//        }
    
    }




