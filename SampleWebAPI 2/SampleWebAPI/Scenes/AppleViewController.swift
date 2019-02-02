//
//  AppleViewController.swift
//  SampleWebAPI
//
//  Created by Benoit BRIATTE on 10/12/2018.
//  Copyright © 2018 Digipolitan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

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
        ConnexionService.default.getToken { (connect) in
            print(connect.token)
            let token = connect.token
            ConnexionService.default.connect(token: token)
            let next = LoginViewController.newInstance()
            self.navigationController?.pushViewController(next, animated: true)
            
            //let next = MovieListViewController.newInstance(movies: movies)//transfer donnée
            //self.navigationController?.pushViewController(next, animated: true)// changement graphique
        }
    }
}
