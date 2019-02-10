//
//  MovieListViewController.swift
//  SampleWebAPI
//
//  Created by Arthur BLANC on 08/01/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
//    @IBAction func Button(_ sender: Any) {
//        MovieService.default.getOneMovie { (movie) in
//            let next = DetailMovieViewController.newInstance(movie:movie)
//            self.navigationController?.pushViewController(next, animated: true)
//            print("fin")
//        }
//
//    }
    
   class func newInstance() -> MovieListViewController {
        let mlvc = MovieListViewController()
        return mlvc
    }
    
    override func viewDidLoad() {
        print("test")
    }
    
}


    

    


