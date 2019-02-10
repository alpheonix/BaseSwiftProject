//
//  AppleViewController.swift
//  SampleWebAPI
//
//  Created by Benoit BRIATTE on 10/12/2018.
//  Copyright © 2018 Digipolitan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var gradient: CAGradientLayer?
    var bgImage: UIImageView?
    let rect = CGRect(x: 100, y: 250, width: 180, height: 180)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignInButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.themoviedb.org/account/signup")! as URL, options: [:], completionHandler: nil)
        
    }
    
    @IBAction func connectToMovieAPI(_ sender: UIButton) {
        print("test")
        // TODO
        let next = LoginViewController.newInstance()
        self.navigationController?.pushViewController(next, animated: true)
        
    }
    
    @IBAction func connectToNewMovieList(_ sender: UIButton) {
        MovieService.default.getMovies { (movies) in
            let next = NewMoviesListViewController.newInstance(movies: movies)
            self.navigationController?.pushViewController(next, animated: true)
        }
        
    }
    
    func addGradient() {
        gradient = CAGradientLayer()
        let startColor = UIColor(red: 220/255, green: 6/255, blue: 190/255, alpha: 3)
        let endColor = UIColor(red: 0, green: 0, blue: 20, alpha: 3)
        gradient?.colors = [startColor.cgColor,endColor.cgColor]
        gradient?.startPoint = CGPoint(x: 0, y: 0)
        gradient?.endPoint = CGPoint(x: 0, y:1)
        gradient?.frame = view.frame
        self.view.layer.insertSublayer(gradient!, at: 0)
    }
    
}
